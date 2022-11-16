import 'package:flutter/material.dart';

class EmptyExpenses extends StatelessWidget {
  const EmptyExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      return Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'No transactions added yet',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Container(
              height: constraint.maxHeight * 0.6,
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );
    });
  }
}
