import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  const BorderBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.purple,
        width: 2,
      )),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: child,
    );
  }
}
