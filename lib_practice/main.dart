import 'package:flutter/material.dart';

import 'view/expense.dart';
import './widget/app_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(),
        body: const SingleChildScrollView(
          child: ExpenseView(),
        ),
      ),
    );
  }
}
