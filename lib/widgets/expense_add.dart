import 'package:flutter/material.dart';

class ExpenseAdd extends StatefulWidget {
  const ExpenseAdd(this.addExpense, {Key? key}) : super(key: key);

  final Function addExpense;

  @override
  State<ExpenseAdd> createState() => _ExpenseAddState();
}

class _ExpenseAddState extends State<ExpenseAdd> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void addExpense() {
    widget.addExpense(
      titleController.text,
      double.parse(amountController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onEditingComplete: addExpense),
            TextButton(
              onPressed: () => addExpense,
              child: const Text(
                'Add Expense',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
