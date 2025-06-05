import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier) onSelectScreen;

  const MainDrawer({super.key, required this.onSelectScreen});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primaryContainer,
                  colorScheme.primaryContainer.withValues(alpha: .8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: EdgeInsetsGeometry.all(20),
            child: Row(
              children: [
                Icon(Icons.fastfood, size: 48, color: colorScheme.primary),
                SizedBox(width: 18),
                Text(
                  "Cooking up!",
                  style: textTheme.titleLarge!.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: colorScheme.onSurface,
            ),
            title: Text(
              "Meals",
              style: textTheme.titleSmall!.copyWith(
                color: colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectScreen("meals");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: colorScheme.onSurface,
            ),
            title: Text(
              "Filters",
              style: textTheme.titleSmall!.copyWith(
                color: colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectScreen("filters");
              // Navigator.of(context).push(route)
            },
          ),
        ],
      ),
    );
  }
}
