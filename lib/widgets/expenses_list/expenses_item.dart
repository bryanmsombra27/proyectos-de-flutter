import 'package:flutter/material.dart';
import 'package:projects_2/models/expense.dart';

class ExpensesItem extends StatelessWidget {
  final Expense expense;

  const ExpensesItem({super.key, required this.expense});

  static const name = "expenses_item";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 4),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                Spacer(), //toma todo el espacio restante del contenedor

                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
