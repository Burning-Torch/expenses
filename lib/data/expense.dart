import '../model/expense.dart';
import 'dart:math';

Random random = Random();

const items = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
];

var dates = [0, 1, 2, 3, 4, 5, 6].map((index) {
  return DateTime.now().subtract(Duration(days: index));
}).toList();

var products = [
  {
    'title': 'Shoes',
    'price': 11.11,
  },
  {
    'title': 'keys',
    'price': 7.0,
  },
  {
    'title': 'Car',
    'price': 13500.33,
  },
  {
    'title': 'Shrt',
    'price': 33.33,
  },
  {
    'title': 'Beer',
    'price': 13.33,
  },
  {
    'title': 'Hat',
    'price': 22.34,
  },
  {
    'title': 'Jacket',
    'price': 33.34,
  },
];

ExpenseModel createExpense() {
  var timeStamp =
      dates[random.nextInt(7)].add(Duration(milliseconds: random.nextInt(999)));
  var product = products[random.nextInt(7)];
  return ExpenseModel(
    id: timeStamp.toString(),
    title: product['title'] as String,
    price: product['price'] as double,
    date: timeStamp,
  );
}

List<ExpenseModel> createExpenses() {
  var expenses = items.map((_) => createExpense()).toList();
  expenses.sort((a, b) => b.date.compareTo(a.date));
  return expenses;
}

var expensesData = createExpenses();
