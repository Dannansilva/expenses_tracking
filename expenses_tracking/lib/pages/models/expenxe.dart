import 'package:uuid/uuid.dart';

final uuid = const Uuid().v4();

enum Categorys {
  food,
  travel,
  leasure,
  work,
}

class Expensemodel {
  Expensemodel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid;

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Categorys category;
}
