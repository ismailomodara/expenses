import 'package:flutter/material.dart';

class ExpensesChart extends StatelessWidget {
  const ExpensesChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 150.0,
      child: Card(
        child: Text(
          'Chart goes here',
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
