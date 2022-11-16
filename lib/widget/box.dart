import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
  final Widget child;

  const BorderBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }
}

class TextBox extends StatelessWidget {
  final String text;

  const TextBox({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 20,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      ),
    );
  }
}
