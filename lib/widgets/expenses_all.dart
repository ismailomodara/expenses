import 'package:flutter/material.dart';

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
