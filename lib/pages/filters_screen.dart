import 'package:flutter/material.dart';
// import 'package:projects_2/pages/index.dart';
// import 'package:projects_2/widgets/index.dart';

enum Filter { gluttenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  final Map<Filter, bool> currentFilters;

  const FiltersScreen({super.key, required this.currentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluttenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _vegetarianFreeFilterSet = false;
  bool _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _veganFreeFilterSet = widget.currentFilters[Filter.vegan]!;
    _gluttenFreeFilterSet = widget.currentFilters[Filter.gluttenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFreeFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text("Your Filters")),

      // drawer: MainDrawer(
      //   onSelectScreen: (id) {
      //     // Navigator.of(context).pop();
      //     // if (id == "meals") {
      //     //   Navigator.of(
      //     //     context,
      //     //   ).pushReplacement(MaterialPageRoute(builder: (ctx) => Tabs()));
      //     // }
      //   },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.gluttenFree: _gluttenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFreeFilterSet,
            Filter.vegan: _veganFreeFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _gluttenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                "Gluten free",
                style: textTheme.titleLarge!.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                "Only include gluten-free meals.",
                style: textTheme.labelMedium!.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              activeColor: colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                "Lactose free",
                style: textTheme.titleLarge!.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                "Only include lactose-free meals.",
                style: textTheme.labelMedium!.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              activeColor: colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeFilterSet = isChecked;
                });
              },
              title: Text(
                "vegetarian",
                style: textTheme.titleLarge!.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                "Only include vegetarian meals.",
                style: textTheme.labelMedium!.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              activeColor: colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterSet = isChecked;
                });
              },
              title: Text(
                "vegan",
                style: textTheme.titleLarge!.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                "Only include vegan meals.",
                style: textTheme.labelMedium!.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              activeColor: colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
