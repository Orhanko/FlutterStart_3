import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pocetak3/exprenses_list.dart';
import 'package:pocetak3/models/expense.dart';
import 'package:pocetak3/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> listOfExpense = [
    Expense(
      title: 'Flutter Course',
      amount: 19.9,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Italy vacay',
      amount: 19.9,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void addExpense(Expense proba) {
    setState(() {
      listOfExpense.add(proba);
    });
  }

  void _showModalScreen() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (item) => NewExpense(addExpense),
    );
  }

  void removeListItem(Expense expense) {
    setState(() {
      listOfExpense.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: _showModalScreen, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(129, 255, 153, 0),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Text(
                    'Chart Placeholder...',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ExpensesList(list: listOfExpense, onRemove: removeListItem),
          ),
        ],
      ),
    );
  }
}
