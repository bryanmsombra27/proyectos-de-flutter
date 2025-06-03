import 'package:flutter/material.dart';
import 'package:projects_2/widgets/expenses.dart';

void main() {
  runApp(const MyApp());
}

final kColorschema = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);

final kDarkColorSchema = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorSchema,

        cardTheme: CardThemeData(
          color: kColorschema.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorSchema.primaryContainer,
            foregroundColor: kDarkColorSchema.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData(
        colorScheme: kColorschema,

        appBarTheme: AppBarTheme(
          backgroundColor: kColorschema.onPrimaryContainer,
          foregroundColor: kColorschema.onPrimaryContainer,
        ),

        cardTheme: CardThemeData(
          color: kColorschema.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorschema.primaryContainer,
          ),
        ),

        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kColorschema.onSecondaryContainer,
            fontSize: 14,
          ),
        ),
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 103, 48, 197),
                const Color.fromARGB(255, 59, 17, 131),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Expenses(),
        ),
      ),
    );
  }
}
