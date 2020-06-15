import 'package:flutter/material.dart';
import 'package:flutterapp/food/core/model/meal_model.dart';
import 'package:flutterapp/food/core/viewmodel/favor_view_model.dart';
import 'package:provider/provider.dart';

class DetailFloatingButton extends StatelessWidget {

  final MealModel mealModel;

  DetailFloatingButton(this.mealModel);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavorViewModel>(
      builder: (ctx, favorVM, child){
        final iconData = favorVM.isFavor(mealModel) ? Icons.favorite : Icons.favorite_border;
        final iconColor = favorVM.isFavor(mealModel) ? Colors.red : Colors.black;

        return FloatingActionButton(
          child: Icon(iconData, color: iconColor,),
          onPressed: () {
            favorVM.handleMeal(mealModel);
          },
        );
      },
    );
  }
}
