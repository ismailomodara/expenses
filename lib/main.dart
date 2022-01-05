import 'package:flutter/material.dart';
import 'widgets/expenses_chart.dart';
import 'widgets/expense_add.dart';
import 'widgets/expenses_all.dart';
import 'models/expenses.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Expenses expenses = Expenses();

  addExpense(String title, double amount) {
    setState(() {
      expenses.addExpense(title, amount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Personal Expenses'),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ExpensesChart(),
              ExpenseAdd(addExpense),
              ExpensesAll(expenses.getExpenses()),
            ],
          ),
        ),
      ),
    );
  }
}
