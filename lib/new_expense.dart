import 'package:flutter/material.dart';
import 'package:pocetak3/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
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
                  onPressed: () {
                    print("Ovo je proba za title: ${titleController.text}");
                    print("Ovo je proba za amount: ${amountController.text}");
                  },
                  child: Text("Save title"),
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
// DropdownButton(
                //   value: selectedCategory,
                //   items:
                //       Category.values
                //           .map(
                //             (category) => DropdownMenuItem(
                //               value: category,
                //               child: Text(category.name.toUpperCase()),
                //             ),
                //           )
                //           .toList(),
                //   onChanged: (value) {
                //     if (value == null) {
                //       return;
                //     }
                //     setState(() {
                //       selectedCategory = value;
                //     });
                //     ;
                //   },
                // ),

  //               void presentDatePicker() async {
  //   final now = DateTime.now();
  //   final firstDate = DateTime(now.year - 1, now.month, now.day);
  //   final pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: now,
  //     firstDate: firstDate,
  //     lastDate: now,
  //   );
  //   setState(() {
  //     selectedDate = pickedDate;
  //   });
  // }
// DateTime? selectedDate;
//   Category selectedCategory = Category.leisure;
