import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './price.dart';
import '../../model/expense.dart';

class ExpenseCard extends StatelessWidget {
  final ExpenseModel expense;
  final Function(String) removeExpense;

  const ExpenseCard({
    super.key,
    required this.expense,
    required this.removeExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 5,
      ),
      child: ListTile(
        leading: Price(price: expense.price),
        title: Text(
          expense.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(DateFormat.yMMMd().format(expense.date)),
        trailing: IconButton(
          onPressed: () => removeExpense(expense.id),
          color: Theme.of(context).errorColor,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
