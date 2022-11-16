import 'package:flutter/material.dart';

final textTheme = ThemeData.light().textTheme.copyWith(
      titleLarge: const TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 24,
      ),
      titleMedium: const TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 20,
      ),
      titleSmall: const TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 16,
      ),
    );

final ThemeData theme = ThemeData(
  primarySwatch: Colors.purple,
  fontFamily: 'Quicksand',
  textTheme: textTheme,
);
