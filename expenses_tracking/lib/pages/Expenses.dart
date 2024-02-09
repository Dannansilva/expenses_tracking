// ignore_for_file: prefer_const_constructors

import 'package:expenses_tracking/pages/models/expenxe.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  //expenses list
  final List<Expensemodel> _expensesList = [
    Expensemodel(
        title: "football",
        amount: 12.5,
        date: DateTime.now(),
        category: Category.leasure),
    Expensemodel(
        title: "pizza",
        amount: 25,
        date: DateTime.now(),
        category: Category.Food)
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses Tracking',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
              iconSize: 35,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _expensesList.length,
              itemBuilder: (context, index) {
                return Text(_expensesList[index].title);
              },
            ),
          ),
        ],
      ),
    );
  }
}
