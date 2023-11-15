import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

//11:10
class _NewExpenseState extends State<NewExpense> {
  // Controller
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            maxLength: 50,
            decoration: const InputDecoration(
                label: Text("Expense Name",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Color.fromARGB(255, 110, 110, 110)))),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                label: Text("Amount",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Color.fromARGB(255, 110, 110, 110))),
                prefixText: "₺"),
          ),
          IconButton(
              onPressed: () {
                // DatePicker açmak..
                // DatePicker'dan gelen değeri Text olarak yazdırmak
              },
              icon: const Icon(Icons.calendar_month)),
          const Text("Tarih Seçiniz..",
              style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Color.fromARGB(255, 110, 110,
                      110))), // seçilen tarihi formatlayarak yazdırmak..
          ElevatedButton(
            onPressed: () {
              print("Kayıt başarılı: ${_nameController.text}");
            },
            child: const Text(("Kaydet"),
                style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Color.fromARGB(255, 110, 110, 110))),
            style: ElevatedButton.styleFrom(shape: StadiumBorder()),
          )
        ],
      ),
    );
  }
}
