import './expense.dart';

class Expenses {
  final List<Expense> _expenses = [
    Expense(
      id: 't1',
      title: 'Reebok Sneakers',
      amount: 20.99,
      date: DateTime.parse('2022-01-10'),
    ),
    Expense(
      id: 't2',
      title: 'Gown',
      amount: 12.99,
      date: DateTime.parse('2022-01-11'),
    ),
    Expense(
      id: 't3',
      title: 'Wrist Watch',
      amount: 3.99,
      date: DateTime.parse('2022-01-10'),
    ),
    Expense(
      id: 't4',
      title: 'Reebok Sneakers',
      amount: 20.99,
      date: DateTime.parse('2022-01-12'),
    ),
    Expense(
      id: 't5',
      title: 'Gown',
      amount: 12.99,
      date: DateTime.parse('2022-01-13'),
    ),
    Expense(
      id: 't6',
      title: 'Wrist Watch',
      amount: 3.99,
      date: DateTime.parse('2022-01-14'),
    ),
  ];

  List<Expense> getExpenses() {
    return _expenses;
  }

  List<Expense> getRecentExpenses() {
    return _expenses.where((ex) {
      return ex.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void addExpense(String title, double amount, DateTime date) {
    var newEx = Expense(
        id: 't${_expenses.length}', title: title, amount: amount, date: date);
    _expenses.add(newEx);
  }

  void deleteExpense(String id) {
    _expenses.removeWhere((ex) => ex.id == id);
  }
}
