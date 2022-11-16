import 'package:flutter/material.dart';

import '../../model/expense.dart';

import './add.dart';
import './list.dart';

var timeNow = DateTime.now();
var timeString = timeNow.toString();

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExpenseState();
  }
}

class ExpenseState extends State<Expense> {
  final List<ExpenseModel> expenses = [
    ExpenseModel(
      id: timeString,
      title: 'Shoes',
      price: 12.99,
      date: timeNow,
    ),
    ExpenseModel(
      id: timeString,
      title: 'Hat',
      price: 15.50,
      date: timeNow,
    ),
  ];

  void addExpense(ExpenseBaseModel data) {
    setState(() {
      var newExpense = ExpenseModel(
        id: timeString,
        title: data.title,
        price: data.price,
        date: timeNow,
      );
      expenses.add(newExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpenseAdd(
          addExpense: addExpense,
        ),
        ExpenseList(
          expenses: expenses,
        ),
      ],
    );
  }
}
