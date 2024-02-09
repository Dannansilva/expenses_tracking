import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

final uuid = const Uuid().v4();

enum Category {
  Food,
  Travel,
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
  final Category category;
}
