import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseAdd extends StatefulWidget {
  const ExpenseAdd(this.addExpense, {Key? key}) : super(key: key);

  final Function addExpense;

  @override
  State<ExpenseAdd> createState() => _ExpenseAddState();
}

class _ExpenseAddState extends State<ExpenseAdd> {
  final _expenseTitleController = TextEditingController();
  final _expenseAmountController = TextEditingController();
  DateTime? _expenseDate;

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _expenseDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }
      _expenseDate = date;
    });
  }

  void addExpense() {
    widget.addExpense(_expenseTitleController.text,
        double.parse(_expenseAmountController.text), _expenseDate);
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
              controller: _expenseTitleController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _expenseAmountController,
                keyboardType: TextInputType.number,
                onEditingComplete: addExpense),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _expenseDate == null
                      ? 'No date chosen'
                      : DateFormat.yMMMd().format(_expenseDate!),
                ),
                TextButton(
                  onPressed: _showDatePicker,
                  child: Text(
                      _expenseDate == null ? 'Choose date' : 'Change date'),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: addExpense,
              child: const Text(
                'Add Expense',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
