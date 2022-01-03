import 'package:flutter/material.dart';

class ExpenseAdd extends StatelessWidget {
  ExpenseAdd(this.addExpense, {Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addExpense;

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
            ),
            TextButton(
              onPressed: () {
                addExpense(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
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
