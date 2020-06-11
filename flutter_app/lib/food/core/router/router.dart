import 'package:flutterapp/food/ui/page/detail/detail.dart';
import 'package:flutterapp/food/ui/page/filter/filter.dart';
import 'package:flutterapp/food/ui/page/main/main.dart';
import 'package:flutterapp/food/ui/page/meal/meal.dart';
import 'package:flutter/material.dart';

class Router {
  static final String initialRouter = MainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainScreen.routeName: (ctx) => MainScreen(),
    MealScreen.routeName: (ctx) => MealScreen(),
    DetailScreen.routeName: (ctx) => DetailScreen()
  };

  static final RouteFactory generateRoute = (settings) {
    if (settings.name == FilterScreen.routeName) {
      return MaterialPageRoute(
        builder: (ctx) {
          return FilterScreen();
        },
        fullscreenDialog: true
      );
    }
    return null;
  };

  static final RouteFactory unknowRouter = (settings) {
    return null;
  };
}
