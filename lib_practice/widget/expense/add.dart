import 'package:flutter/material.dart';

import '../../model/expense.dart';

class ExpenseAdd extends StatelessWidget {
  final void Function(ExpenseBaseModel) addExpense;
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  ExpenseAdd({
    super.key,
    required this.addExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Price',
              ),
              controller: priceController,
            ),
            TextButton(
              onPressed: () {
                addExpense(ExpenseBaseModel(
                  title: titleController.text,
                  price: double.parse(priceController.text),
                ));
              },
              child: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
