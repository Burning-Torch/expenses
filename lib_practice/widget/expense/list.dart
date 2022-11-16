import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/expense.dart';

import './price.dart';

class ExpenseList extends StatelessWidget {
  final List<ExpenseModel> expenses;
  const ExpenseList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: expenses.map((expense) {
            return Card(
              child: Row(
                children: [
                  Price(price: expense.price),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(expense.title),
                      Text(DateFormat('yyyy/MM/dd').format(expense.date)),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
