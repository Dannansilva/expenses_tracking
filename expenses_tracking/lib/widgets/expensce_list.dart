import 'package:expenses_tracking/pages/models/expenxe.dart';
import 'package:expenses_tracking/widgets/expense_tile.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget {
  const ExpenceList({super.key, required this.expensesList});

  final List<Expensemodel> expensesList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ExpenseTile(
              expence: expensesList[index],
            ),
          );
        },
      ),
    );
  }
}
