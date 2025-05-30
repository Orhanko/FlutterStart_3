import 'package:flutter/material.dart';
import 'package:pocetak3/expense_item.dart';
import 'package:pocetak3/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.list, required this.onRemove});
  final List<Expense> list;
  final void Function(Expense expense) onRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder:
          (item, index) => Dismissible(
            key: ValueKey(list[index]),
            onDismissed: (direction) {
              onRemove(list[index]);
            },
            child: ExpenseItem(list[index]),
          ),
    );
  }
}
