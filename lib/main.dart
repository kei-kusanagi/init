import 'package:flutter/material.dart';
import 'package:initial/screens/home_screen.dart';
import 'package:initial/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);
    final appTheme = AppTheme(themeModel);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme.getTheme(),
        home: HomeScreen());
  }
}
