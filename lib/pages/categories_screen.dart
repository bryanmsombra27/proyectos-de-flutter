import 'package:flutter/material.dart';
import 'package:projects_2/data/fake.dart';
import 'package:projects_2/models/category.dart';
import 'package:projects_2/models/meal.dart';
import 'package:projects_2/pages/index.dart';
import 'package:projects_2/widgets/index.dart';

class CategoriesScreen extends StatelessWidget {
  final void Function(Meal meal) onToggleFavorite;
  const CategoriesScreen({super.key, required this.onToggleFavorite});

  static const name = "categories_screen";

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // Navigator.of(context).push(route); // otra alternativa de navigar entre pantallas
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...availableCategories.map(
          (category) => CategoryGridItem(
            category: category,
            onTap: () {
              _selectCategory(context, category);
            },
          ),
        ),
      ],
    );
  }
}
