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
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Lato',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall: const TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
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
    if (title.isEmpty || amount <= 0) {
      return;
    }
    setState(() {
      expenses.addExpense(title, amount);
    });
    Navigator.pop(context);
  }

  void showExpenseAdd(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (bContext) {
        return ExpenseAdd(addExpense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Personal Expenses'),
          backgroundColor: Colors.teal,
          actions: [
            IconButton(
              onPressed: () => showExpenseAdd(context),
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ExpensesChart(),
              ExpensesAll(expenses.getExpenses()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: const Icon(Icons.add),
          onPressed: () => showExpenseAdd(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
