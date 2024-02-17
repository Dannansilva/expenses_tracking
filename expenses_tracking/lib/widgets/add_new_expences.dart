// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:expenses_tracking/pages/models/expenxe.dart';

import 'package:flutter/material.dart';

class AddNewExpence extends StatefulWidget {
  final void Function(Expensemodel expence) onAddExpence;
  const AddNewExpence({super.key, required this.onAddExpence});

  @override
  State<AddNewExpence> createState() => _AddNewExpenceState();
}

class _AddNewExpenceState extends State<AddNewExpence> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Categorys _selectedCategory = Categorys.food;

  //date variable
  final DateTime initialDate = DateTime.now();
  final DateTime firstDate = DateTime(
      DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
  final DateTime lastDate = DateTime(
      DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);
  DateTime _selectedDate = DateTime.now();
  //date picker
  Future<void> _openDatePicker() async {
    try {
      //show the date modal and stor the selected date
      final pickedDate = await showDatePicker(
          context: context, firstDate: firstDate, lastDate: lastDate);
      setState(() {
        _selectedDate = pickedDate!;
      });
    } catch (error) {
      print(error.toString());
    }
  }

  //handle form submit
  void _handleFormSubmit() {
    //form validation
    //convert the amount to double
    final userAmount = double.parse(_amountController.text.trim());
    if (_titleController.text.isEmpty || userAmount <= 0) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("enter valid data"),
            content: Text(
                "Please eneter valid data for the title and the amount here the tittle cant be empty and the amount cant be less than zero"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("close"),
              ),
            ],
          );
        },
      );
    } else {
      //create the expence
      Expensemodel newExpence = Expensemodel(
          title: _titleController.text.trim(),
          amount: -userAmount,
          date: _selectedDate,
          category: _selectedCategory);
      //save the data
      widget.onAddExpence(newExpence);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          //text field for the title
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: "add new expence",
              label: Text("Tiltle"),
            ),
            keyboardType: TextInputType.text,
            maxLength: 50,
          ),
          Row(
            children: [
              //amount
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    hintText: "Amount",
                    label: Text("Amount"),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),

              //date picker
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(famattedDate.format(_selectedDate)),
                    IconButton(
                      onPressed: _openDatePicker,
                      icon: Icon(Icons.calendar_today),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Categorys.values
                    .map((Category) => DropdownMenuItem(
                        value: Category, child: Text(Category.name)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //close the button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "close",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    //save the data and close the modal
                    ElevatedButton(
                      onPressed: _handleFormSubmit,
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueAccent)),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
