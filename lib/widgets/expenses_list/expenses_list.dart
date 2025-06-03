import 'package:flutter/material.dart';
import 'package:projects_2/models/expense.dart';
import 'package:projects_2/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onDelete;

  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onDelete,
  });

  static const name = "expenses_list";

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        final expense = expenses[index];

        // return ListTile(leading: Text(expense.title));
        return Dismissible(
          // key: Key(expense.id),
          key: ValueKey(expense.id),
          onDismissed: (direction) {
            onDelete(expense);
          },
          child: ExpensesItem(expense: expense),
        );
      },
      itemCount: expenses.length,
    );
  }
}
