import 'package:flutter/material.dart';
import 'package:flutterapp/food/core/model/meal_model.dart';
import 'package:flutterapp/food/core/viewmodel/favor_view_model.dart';
import 'package:flutterapp/food/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class FavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<FavorViewModel>(
      builder: (ctx, favorVM, child) {
        if (favorVM.meals.length == 0) {
          return Center(
            child: Text("未收藏美食")
          );
        }

        return ListView.builder(itemBuilder: (itemCtx, index) {
          return MealItem(favorVM.meals[index]);
        },
        itemCount: favorVM.meals.length,);
      },
    );

  }
}
