import 'package:flutter/material.dart';
import 'package:flutterapp/food/core/model/category_model.dart';
import 'package:flutterapp/food/core/model/meal_model.dart';
import 'package:flutterapp/food/core/viewmodel/meal_view_model.dart';
import 'package:flutterapp/food/ui/page/meal/meal.dart';
import 'package:flutterapp/food/ui/widgets/meal_item.dart';
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
            final mealModel = meals[index];
            return MealItem(meals[index]);
          },
          itemCount: meals.length,
        );
      },
    );
  }
}
