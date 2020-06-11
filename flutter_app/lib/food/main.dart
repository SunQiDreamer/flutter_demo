import "package:flutter/material.dart";
import 'package:flutterapp/food/core/router/router.dart';
import 'package:flutterapp/food/ui/share/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "美食广场",
      theme: AppTheme.norTheme,
      initialRoute: Router.initialRouter,
      routes: Router.routes,
      onGenerateRoute: Router.generateRoute,
      onUnknownRoute: Router.unknowRouter,
    );
  }
}
