import 'package:flutter/material.dart';
import 'package:flutterapp/food/core/model/category_model.dart';
import 'package:flutterapp/food/core/model/meal_model.dart';
import 'package:flutterapp/food/core/viewmodel/meal_view_model.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class MealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as CategoryModel;

    return Selector<MealViewModel, List<MealModel>>(
      selector: (ctx, mealVM) {
        return mealVM.meals.where((element) {
          return element.catrgories.contains(category.id);
        }).toList();
      },
      shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
      builder: (ctx, meals, child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
              width: 100,
              height: 50,
              child: Text("1111"),
            );
          },
          itemCount: meals.length,
        );
      },
    );
  }
}
