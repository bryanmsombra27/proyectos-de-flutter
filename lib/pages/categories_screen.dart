import 'package:flutter/material.dart';
import 'package:projects_2/data/fake.dart';
import 'package:projects_2/widgets/index.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const name = "categories_screen";

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
            (category) => CategoryGridItem(category: category),
          ),
        ],
      ),
    );
  }
}
