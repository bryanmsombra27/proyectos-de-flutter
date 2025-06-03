import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projects_2/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) addExpense;

  const NewExpense({super.key, required this.addExpense});

  static const name = "new_expense";

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // forma 1 de manejar los valores de los inputs en flutter
  // late String _enteredTitle = "";

  // void _saveTitleInput(String value) {
  //   _enteredTitle = value;
  // }

  // FORMA 2 DE MANEJAR LOS VALORES DE LOS INPUTS EN FLUTTER
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
    );

    setState(() {
      _selectedDate = pickedDate!;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Invalid input"),
            content: Text(
              "Please provide a valid title, amount and category was entered",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("Okay"),
              ),
            ],
          );
        },
      );
      return;
    }

    // el objeto widget contiene la referencia a las propiedades que son definidas en el stateful widget de esa forma podemos acceder cuando los valores son pasados a esos componentes  de sus propiedades
    widget.addExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );

    Navigator.pop(context);
  }

  // FORMA 2 DE MANEJAR LOS VALORES DE LOS INPUTS EN FLUTTER ES IMPORTANTE HACER EL DISPOSE DEL CONTROLLER YA QUE SI NO SE REALIZA ESTE PUEDE OCASIONAR FUGAS DE MEMORIA EN LA APLICACION Y PODRIA OCASIONAR QUE LA APLICACION SE DETENGA INESPERADAMENTE
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            // FORMA 2 DE MANEJAR LOS VALORES DE LOS INPUTS EN FLUTTER
            controller: _titleController,
            // forma 1 de manejar los valores de los inputs en flutter
            // onChanged: _saveTitleInput,
            maxLength: 50,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Amount"),
                    prefixText: "\$ ",
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        _selectedDate == null
                            ? "No date selected"
                            : formatter.format(_selectedDate!),
                      ),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              Spacer(),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: Text("Save Expense"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
