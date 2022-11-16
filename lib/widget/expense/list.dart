import 'package:flutter/material.dart';

import '../../model/expense.dart';
import './empty.dart';
import './expense_card.dart';

class ExpenseList extends StatelessWidget {
  final double appBarHeight;
  final List<ExpenseModel> expenses;
  final Function(String) removeExpense;

  const ExpenseList({
    super.key,
    required this.appBarHeight,
    required this.expenses,
    required this.removeExpense,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var inPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var bodyHeight = height - appBarHeight - 25;
    return SizedBox(
      height: bodyHeight * (inPortrait ? 0.6 : 0.75),
      child: expenses.isEmpty
          ? const EmptyExpenses()
          : ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return ExpenseCard(
                  expense: expenses[index],
                  removeExpense: removeExpense,
                );
              },
            ),
    );
  }
}
