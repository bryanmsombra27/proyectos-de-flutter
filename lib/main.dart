import 'package:flutter/material.dart';
import 'package:projects_2/config/theme.dart';
import 'package:projects_2/pages/index.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeApp().theme(),
      home: Tabs(),
    );
  }
}
