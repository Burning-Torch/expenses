class ExpenseBaseModel {
  final String title;
  final double price;
  final DateTime date;

  ExpenseBaseModel({
    required this.title,
    required this.price,
    required this.date,
  });
}

class ExpenseModel {
  final String id;
  final String title;
  final double price;
  final DateTime date;

  const ExpenseModel({
    required this.id,
    required this.title,
    required this.price,
    required this.date,
  });
}
