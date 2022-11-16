import 'package:flutter/material.dart';

import '../widget/chart.dart';
import '../widget/expense/expense.dart';

class ExpenseView extends StatelessWidget {
  const ExpenseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Chart(),
        Expense(),
      ],
    );
  }
}
