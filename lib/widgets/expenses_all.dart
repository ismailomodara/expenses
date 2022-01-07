import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesAll extends StatelessWidget {
  final List _expenses;

  const ExpensesAll(this._expenses, {Key? key}) : super(key: key);

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
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(
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
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        DateFormat('MMM d, yyyy').format(_expenses[index].date),
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
