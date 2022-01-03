import 'package:flutter/material.dart';
import 'widgets/expenses_chart.dart';
import 'widgets/expenses.dart';

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

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  test() {}

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
            children: const [
              ExpensesChart(),
              Expenses(),
            ],
          ),
        ),
      ),
    );
  }
}
