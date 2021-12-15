import 'package:flutter/material.dart';
import 'package:flutter_dart_apprentice/page/home_page.dart';
import 'package:flutter_dart_apprentice/page/scaffolds/scaffold_widget.dart';
import 'package:flutter_dart_apprentice/theme/theme_setting.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = ThemeSetting.themeLight();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
