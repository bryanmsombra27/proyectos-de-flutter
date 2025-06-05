import 'package:flutter/material.dart';
import 'package:projects_2/pages/index.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  static const name = "tabs";

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen();
    String activePageTitle = "Categories";

    if (_selectedIndex == 1) {
      activePage = MealsScreen(meals: []);
      activePageTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
        onTap: _selectPage,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
