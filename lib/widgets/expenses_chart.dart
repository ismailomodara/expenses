import 'package:flutter/material.dart';

class ExpensesChart extends StatelessWidget {
  const ExpensesChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 10,
      child: Text(
        'Chart goes here',
        style: TextStyle(
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
