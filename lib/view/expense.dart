import 'package:flutter/material.dart';

import '../widget/chart/chart.dart';
import '../widget/expense/expense.dart';
import '../widget/expense/add.dart';
import '../../model/expense.dart';

class ExpenseView extends StatelessWidget {
  final Function(ExpenseBaseModel) addExpense;
  final List<ExpenseModel> recentExpenses;
  final double appBarHeight;
  final List<ExpenseModel> expenses;
  final Function(String) removeExpense;

  const ExpenseView({
    super.key,
    required this.addExpense,
    required this.appBarHeight,
    required this.expenses,
    required this.recentExpenses,
    required this.removeExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChartStack(
          appBarHeight: appBarHeight,
          recentExpenses: recentExpenses,
        ),
        Expense(
          appBarHeight: appBarHeight,
          expenses: expenses,
          removeExpense: removeExpense,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 300),
          child: ExpenseAdd(
            addExpense: addExpense,
          ),
        ),
      ],
    );
  }
}
