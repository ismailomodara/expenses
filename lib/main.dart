import 'package:flutter/material.dart';
import 'widgets/expenses_chart.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Personal Expenses'),
        ),
        body: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: const [
              ExpensesChart(),
            ],
          ),
        ),
      ),
    );
  }
}
