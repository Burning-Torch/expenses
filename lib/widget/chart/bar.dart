import 'package:flutter/material.dart';

import '../box.dart';

class BarData {
  final String label;
  final double amount;
  double percent;

  BarData({
    required this.label,
    required this.amount,
    this.percent = 0.0,
  });
}

class Bar extends StatelessWidget {
  final BarData data;

  const Bar({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              height: constraints.maxHeight * 0.1,
              child: TextBox(text: '\$${data.amount.toStringAsFixed(0)}'),
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 30,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(3),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: data.percent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              height: constraints.maxHeight * 0.1,
              child: TextBox(text: data.label),
            ),
          ],
        );
      },
    );
  }
}

class Bars extends StatelessWidget {
  final List<BarData> data;

  const Bars({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: data.map((bar) {
        return Bar(data: bar);
      }).toList(),
    );
  }
}
