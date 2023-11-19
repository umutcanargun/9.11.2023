import 'package:flutter_application/pages/widgets/expenses.dart';
import 'package:flutter_application/pages/widgets/expense_list.dart';
import 'package:flutter_application/pages/widgets/add_new_expense.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 236, 123),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "Expense App",
          style: TextStyle(
              fontFamily: 'Raleway', color: Color.fromARGB(255, 110, 110, 110)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context, builder: (ctx) => NewExpense());
              },
              icon: const Icon(Icons.add,
                  color: Color.fromARGB(255, 110, 110, 110))),
        ],
      ),
      body: Center(
          child: Column(
        children: [
          const Row(
            children: [
              Text('Total',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color.fromARGB(255, 231, 87, 87),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              Text('Food',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color.fromARGB(255, 1, 1, 159),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              Text('Travel',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color.fromARGB(255, 50, 142, 245),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              Text('Work',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color.fromARGB(255, 249, 64, 2),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              Text('Education',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color.fromARGB(255, 252, 2, 252),
                      fontSize: 20,
                      fontWeight: FontWeight.bold))
            ],
          ),
          const Spacer(),
          SfCircularChart(series: <CircularSeries<ChartData, String>>[
            RadialBarSeries<ChartData, String>(
                maximumValue: totalExpenditure,
                radius: '100%',
                gap: '3%',
                dataSource: chartData,
                cornerStyle: CornerStyle.bothCurve,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                pointColorMapper: (ChartData data, _) => data.z,
                dataLabelSettings: const DataLabelSettings(
                    // Renders the data label
                    isVisible: true))
          ]),
          const Spacer(),
          ExpenseList(),
          const Spacer(),
        ],
      )),
    );
  }
}
