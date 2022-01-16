import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/expenses_chart.dart';
import 'widgets/expense_add.dart';
import 'widgets/expenses_all.dart';
import 'models/expenses.dart';

void main() {
  WidgetsFlutterBinding();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
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
                fontWeight: FontWeight.bold,
              ),
            ),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              buttonColor: Colors.red,
              highlightColor: Colors.red,
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

  addExpense(String title, double amount, DateTime date) {
    if (title.isEmpty || amount <= 0) {
      return;
    }
    setState(() {
      expenses.addExpense(title, amount, date);
    });
    Navigator.pop(context);
  }

  deleteExpense(String id) {
    setState(() {
      expenses.deleteExpense(id);
    });
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
    final appBar = AppBar(
      title: const Text('Personal Expenses'),
      backgroundColor: Colors.teal,
      actions: [
        IconButton(
          onPressed: () => showExpenseAdd(context),
          icon: const Icon(Icons.add),
        )
      ],
    );

    final excludingHeight =
        MediaQuery.of(context).padding.top + appBar.preferredSize.height + 30;

    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height:
                      (MediaQuery.of(context).size.height - excludingHeight) *
                          0.3,
                  child: ExpensesChart(
                    expenses.getRecentExpenses(),
                  ),
                ),
                SizedBox(
                  height:
                      (MediaQuery.of(context).size.height - excludingHeight) *
                          0.7,
                  child: ExpensesAll(expenses.getExpenses(), deleteExpense),
                ),
              ],
            ),
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
