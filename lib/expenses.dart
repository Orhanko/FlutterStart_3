import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pocetak3/chart.dart';
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
    final expenseIndex = listOfExpense.indexOf(expense);
    setState(() {
      listOfExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text("Expense deleted."),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              listOfExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text("List of expenses is empty. Start adding it!"),
    );
    if (listOfExpense.isNotEmpty) {
      mainContent = ExpensesList(list: listOfExpense, onRemove: removeListItem);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: _showModalScreen, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: listOfExpense),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
