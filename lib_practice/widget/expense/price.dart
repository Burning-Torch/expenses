import 'package:flutter/material.dart';

import '../box.dart';

class Price extends StatelessWidget {
  final double price;

  const Price({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return BorderBox(
      child: SizedBox(
        width: 100,
        child: Text(
          '\$$price',
          style: const TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
