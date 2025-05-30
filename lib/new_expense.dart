import 'package:flutter/material.dart';
import 'package:pocetak3/expenses.dart';
import 'package:pocetak3/models/expense.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense) dodavanje;
  const NewExpense(this.dodavanje, {super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? pickedDate;
  Category selectedCategory = Category.leisure;

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final datePicker = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      pickedDate = datePicker;
    });
  }

  void saveExpenseData() {
    final amountConverted = double.tryParse(amountController.text);
    final amountInvalid = amountConverted == null || amountConverted <= 0;
    if (titleController.text.trim().isEmpty ||
        pickedDate == null ||
        amountInvalid) {
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: Text("Title alerta"),
              content: Text("Content alerta"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: Text("Ok"),
                ),
              ],
            ),
      );
      return;
    }
    final proba = Expense(
      amount: amountConverted,
      title: titleController.text,
      date: pickedDate!,
      category: selectedCategory,
    );
    widget.dodavanje(proba);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Title of New Expense...')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    prefixText: "\$",
                    label: Text('Amount of New Expense...'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      pickedDate == null
                          ? "Enter Date"
                          : formatter.format(pickedDate!),
                    ),
                    IconButton(
                      onPressed: presentDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  value: selectedCategory,
                  items:
                      Category.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name.toString()),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: saveExpenseData,
                  child: Text("Save Expense"),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
