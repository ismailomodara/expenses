import 'package:flutter/material.dart';
import '../widgets/expense_add.dart';
import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(
      id: 't1',
      title: 'Reebok White Sneakers',
      amount: 20.99,
      date: DateTime.now(),
    ),
    Expense(
      id: 't2',
      title: 'Diary Milk Chocolate',
      amount: 4.99,
      date: DateTime.now(),
    ),
    Expense(
      id: 't3',
      title: 'Pulpy Orange Juice 1L',
      amount: 0.99,
      date: DateTime.now(),
    ),
    Expense(
      id: 't4',
      title: 'Toilet Paper (6 packs)',
      amount: 7.99,
      date: DateTime.now(),
    ),
    Expense(
      id: 't4',
      title: 'Toilet Paper (6 packs)',
      amount: 7.99,
      date: DateTime.now(),
    )
  ];

  addExpense(String title, double amount) {
    var newEx = Expense(
        id: 't${_expenses.length}',
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _expenses.add(newEx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ExpenseAdd(addExpense),
          ExpensesList(_expenses),
        ],
      ),
    );
  }
}

class ExpensesList extends StatelessWidget {
  final List _expenses;
  const ExpensesList(this._expenses, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    margin: const EdgeInsets.only(right: 10.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 0),
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          8.0,
                        ),
                      ),
                    ),
                    child: Text(
                      _expenses[index].amount.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _expenses[index].title,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        _expenses[index].date.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: _expenses.length,
      ),
    );
  }
}
