import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesAll extends StatelessWidget {
  final List _expenses;
  Function deleteExpense;

  ExpensesAll(this._expenses, this.deleteExpense, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Container(
                width: 60,
                margin: const EdgeInsets.only(right: 10.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                ),
                child: Text(
                  _expenses[index].amount.toStringAsFixed(2),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                _expenses[index].title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text(
                DateFormat('MMM d, yyyy').format(_expenses[index].date),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).primaryColorLight,
                onPressed: () => deleteExpense(_expenses[index].id),
              ),
            ),
          );
        },
        itemCount: _expenses.length,
      ),
    );
  }
}
