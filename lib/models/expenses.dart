import './expense.dart';

class Expenses {
  final List<Expense> _expenses = [
    Expense(
      id: 't1',
      title: 'Reebok White Sneakers',
      amount: 20.99,
      date: DateTime.now(),
    ),
    Expense(
      id: 't2',
      title: 'Diary Milk Chocolate',
      amount: 4.99,
      date: DateTime.now(),
    ),
    // Expense(
    //   id: 't3',
    //   title: 'Pulpy Orange Juice 1L',
    //   amount: 0.99,
    //   date: DateTime.now(),
    // ),
    // Expense(
    //   id: 't4',
    //   title: 'Toilet Paper (6 packs)',
    //   amount: 7.99,
    //   date: DateTime.now(),
    // ),
    // Expense(
    //   id: 't4',
    //   title: 'Toilet Paper (6 packs)',
    //   amount: 7.99,
    //   date: DateTime.now(),
    // )
  ];

  List getExpenses() {
    return _expenses;
  }

  void addExpense(String title, double amount) {
    var newEx = Expense(
        id: 't${_expenses.length}',
        title: title,
        amount: amount,
        date: DateTime.now());
    _expenses.add(newEx);
  }
}
