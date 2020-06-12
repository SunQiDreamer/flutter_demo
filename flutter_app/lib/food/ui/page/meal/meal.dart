import 'package:flutter/material.dart';
import 'package:flutterapp/food/core/model/category_model.dart';
import 'package:flutterapp/food/ui/page/meal/meal_content.dart';

class MealScreen extends StatelessWidget {
  static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: MealContent(),
    );
  }
}
