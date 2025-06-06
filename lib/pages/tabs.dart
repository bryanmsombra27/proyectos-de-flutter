import 'package:flutter/material.dart';
import 'package:projects_2/models/meal.dart';
import 'package:projects_2/pages/index.dart';
import 'package:projects_2/widgets/index.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  static const name = "tabs";

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage("Meal is no longer a favorite!");
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage("Meal marked as favorite!");
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
    );
    String activePageTitle = "Categories";

    if (_selectedIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = "Favorites";
    }

    void _setScreen(String identifier) async {
      Navigator.of(context).pop();

      if (identifier == "filters") {
        // Navigator.of(context).pushReplacement(
        final result = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
            builder: (ctx) {
              return FiltersScreen();
            },
          ),
        );
        print("FILTROS SELECCIONADOS $result");
      }
    }

    return Scaffold(
      drawer: MainDrawer(onSelectScreen: _setScreen),
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
