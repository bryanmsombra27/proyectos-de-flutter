import 'package:flutter/material.dart';
import 'package:projects_2/data/fake.dart';
import 'package:projects_2/pages/index.dart';
import 'package:projects_2/widgets/index.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const name = "categories_screen";

  void _selectCategory(BuildContext context) {
    // Navigator.of(context).push(route); // otra alternativa de navigar entre pantallas
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: "Meal", meals: []),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick your category")),
      body: GridView(
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
                _selectCategory(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
