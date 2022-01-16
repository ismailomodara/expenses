import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesChart extends StatelessWidget {
  final List<Expense> recentExpenses;

  const ExpensesChart(this.recentExpenses, {Key? key}) : super(key: key);

  List<Map<String, dynamic>> get groupedExpenses {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var amount = 0.0;

      for (int i = 0; i < recentExpenses.length; i++) {
        var exDate = DateFormat.yMMMd().format(recentExpenses[i].date);
        var weekDayDate = DateFormat.yMMMd().format(weekDay);

        if (exDate == weekDayDate) {
          amount = amount + recentExpenses[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': amount
      };
    }).reversed.toList();
  }

  double get expenseDaily {
    return groupedExpenses.fold(0.0, (total, ex) {
      return total + ex['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedExpenses.map((ex) {
              return ChartBar(ex['day'], ex['amount']);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;

  const ChartBar(this.label, this.amount, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
          child: Text(
            '\$${amount.toStringAsFixed(2)}',
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 100.0,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                height: 100 - amount,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: amount == 0
                      ? const BorderRadius.all(Radius.circular(5))
                      : const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
