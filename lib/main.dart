import 'package:flutter/material.dart';

import 'core/route/app_route.dart';
import 'core/route/app_route_name.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "File Manager",
      theme: Theme.light,
      themeMode: ThemeMode.light,
      initialRoute: AppRouteName.login,
      onGenerateRoute: AppRoute.generate,
    );
  }
}

class Theme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'font',
    useMaterial3: false
  );
}
