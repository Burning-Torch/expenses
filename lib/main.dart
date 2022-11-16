import 'package:flutter/material.dart';

import './style.dart';
import './view/expense.dart';
import './widget/expense/add.dart';
import '../../model/expense.dart';
import '../../data/expense.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final List<ExpenseModel> expenses = List.from(expensesData);

  List<ExpenseModel> get recentExpenses {
    return expenses.where((expense) {
      return expense.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void addExpense(ExpenseBaseModel data) {
    setState(() {
      var newExpense = ExpenseModel(
        id: DateTime.now().toString(),
        title: data.title,
        price: data.price,
        date: data.date,
      );
      expenses.add(newExpense);
      expenses.sort((a, b) => b.date.compareTo(a.date));
    });
  }

  void removeExpense(String expenseId) => setState(
      () => expenses.removeWhere((expense) => expense.id == expenseId));

  void startAddExpense(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: ExpenseAdd(
            addExpense: addExpense,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar;
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          secondary: Colors.amber,
        ),
      ),
      home: Builder(
        builder: (materialCxt) {
          appBar = AppBar(
            title: const Text(
              'Expenses',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => startAddExpense(materialCxt),
                icon: const Icon(Icons.add),
              ),
            ],
          );
          return Scaffold(
            appBar: appBar,
            body: SingleChildScrollView(
              child: ExpenseView(
                addExpense: addExpense,
                appBarHeight: appBar.preferredSize.height,
                expenses: expenses,
                recentExpenses: recentExpenses,
                removeExpense: removeExpense,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => startAddExpense(materialCxt),
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
