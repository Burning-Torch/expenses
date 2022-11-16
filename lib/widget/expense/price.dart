import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  final double price;

  const Price({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FittedBox(
            child: Text(
              '\$$price',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: const Color.fromRGBO(120, 120, 120, 1),
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
