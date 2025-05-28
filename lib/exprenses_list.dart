import 'package:flutter/material.dart';
import 'package:pocetak3/expense_item.dart';
import 'package:pocetak3/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.list});
  final List<Expense> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (item, index) => ExpenseItem(list[index]),
    );
  }
}
