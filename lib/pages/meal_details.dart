import 'package:flutter/material.dart';
import 'package:projects_2/models/meal.dart';

class MealDetails extends StatelessWidget {
  final Meal meal;

  const MealDetails({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Image.network(
        meal.imageUrl,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
