import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = const Uuid().v4();
//date formater
final famattedDate = DateFormat.yMd();

enum Categorys {
  food,
  travel,
  leasure,
  work,
}

// category icons
final CategoryIcons = {
  Categorys.food: Icons.lunch_dining,
  Categorys.travel: Icons.airplanemode_active,
  Categorys.leasure: Icons.sports_esports,
  Categorys.work: Icons.work,
};

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
