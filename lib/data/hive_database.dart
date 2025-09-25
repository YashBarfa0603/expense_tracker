import 'dart:ffi';

import 'package:expense_tracker/models/expense_item.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  // reference our box
  final myBox = Hive.box('expense_database');

  // write data
  void saveData(List<ExpenseItem> allExpense) {
    List<List<dynamic>> allExpensesFormatted = [];
    for (var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpensesFormatted.add(expenseFormatted);
    }

    myBox.put('ALL_EXPENSE', allExpensesFormatted);
  }

  // read data
  List<ExpenseItem> readData() {
    List svaedExpenses = myBox.get('ALL_EXPENSE', defaultValue: []);
    List<ExpenseItem> allExpense = [];

    for (int i = 0; i < svaedExpenses.length; i++) {
      String name = svaedExpenses[i][0];
      String amount = svaedExpenses[i][1];
      DateTime dateTime = svaedExpenses[i][2];

      // create expense item
      ExpenseItem expenseItem = ExpenseItem(
        name: name,
        amount: amount,
        dateTime: dateTime,
      );
      allExpense.add(expenseItem);
    }
    return allExpense;
  }
}
