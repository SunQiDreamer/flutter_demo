import "package:flutter/material.dart";
import 'package:flutterapp/food/core/router/router.dart';
import 'package:flutterapp/food/core/viewmodel/favor_view_model.dart';
import 'package:flutterapp/food/core/viewmodel/filter_view_model.dart';
import 'package:flutterapp/food/core/viewmodel/meal_view_model.dart';
import 'package:flutterapp/food/ui/share/app_theme.dart';
import 'package:flutterapp/utils/size_fit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => FilterViewModel()),
      ChangeNotifierProxyProvider<FilterViewModel, MealViewModel>(
        create: (ctx) => MealViewModel(),
        update: (ctx, filterVM, mealVM) {
          mealVM.updateFilters(filterVM);
          return mealVM;
        },
      ),
      ChangeNotifierProxyProvider<FilterViewModel, FavorViewModel>(
        create: (ctx) => FavorViewModel(),
        update: (ctx, filterVM, favorVM) {
          favorVM.updateFilters(filterVM);
          return favorVM;
        },
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 对HYSizeFit进行初始化
    SizeFit.initialize();

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
