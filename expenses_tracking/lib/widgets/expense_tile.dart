import 'package:expenses_tracking/pages/models/expenxe.dart';
import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({super.key, required this.expence});

  final Expensemodel expence;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[100],
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expence.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  expence.amount.toStringAsFixed(2),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.mobile_friendly),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(famattedDate.format(expence.date))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
