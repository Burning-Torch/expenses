import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/expense.dart';

class ExpenseAdd extends StatefulWidget {
  final Function(ExpenseBaseModel) addExpense;

  const ExpenseAdd({
    super.key,
    required this.addExpense,
  });

  @override
  State<StatefulWidget> createState() {
    return ExpenseAddState();
  }
}

class ExpenseAddState extends State<ExpenseAdd> {
  DateTime datePicked = DateTime.now();
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  void submit() {
    var price = double.parse(priceController.text);
    if (titleController.text == '' || priceController.text == '' || price < 0) {
      return;
    }
    widget.addExpense(ExpenseBaseModel(
      title: toBeginningOfSentenceCase(titleController.text)!,
      price: price,
      date: datePicked,
    ));

    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    var dateNow = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: dateNow,
      firstDate: dateNow.subtract(const Duration(days: 90)),
      lastDate: dateNow,
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        datePicked = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'New Expense',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: titleController,
                  onSubmitted: (_) => submit(),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submit(),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        DateFormat('yyyy/mm/dd').format(datePicked),
                      ),
                      TextButton(
                        onPressed: presentDatePicker,
                        child: const Text('Choose Date'),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: submit,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColorLight,
                    ),
                  ),
                  child: Text(
                    'Add Expense',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
