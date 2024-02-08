// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
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
    );
  }
}
