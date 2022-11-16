import 'package:flutter/material.dart';

import './list.dart';
import '../../model/expense.dart';

class Expense extends StatelessWidget {
  final double appBarHeight;
  final List<ExpenseModel> expenses;
  final Function(String) removeExpense;

  const Expense({
    super.key,
    required this.appBarHeight,
    required this.expenses,
    required this.removeExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpenseList(
          appBarHeight: appBarHeight,
          expenses: expenses,
          removeExpense: removeExpense,
        ),
      ],
    );
  }
}
