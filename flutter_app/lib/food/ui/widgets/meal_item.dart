import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/food/core/model/meal_model.dart';
import 'package:flutterapp/food/core/viewmodel/favor_view_model.dart';
import 'package:flutterapp/food/ui/page/detail/detail.dart';
import 'package:flutterapp/extension/int_extension.dart';
import 'package:flutterapp/food/ui/widgets/operatio_item.dart';
import 'package:provider/provider.dart';

final cardRadius = 12.px;

class MealItem extends StatelessWidget {
  final MealModel _mealModel;
  MealItem(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardRadius)),
        child: Column(
          children: <Widget>[
            buildBasicInfo(context),
            buildOperationInfo()
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(DetailScreen.routeName, arguments: _mealModel);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(cardRadius),
              topRight: Radius.circular(cardRadius)
          ),
          child: Image.network(_mealModel.imageUrl, width: double.infinity, height: 250.px, fit: BoxFit.cover,),
        ),
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(6.px)
            ),
            child: Text(_mealModel.title, style: Theme.of(context).textTheme.display3.copyWith(color: Colors.white),),
          ),
        )
      ],
    );
  }

  Widget buildOperationInfo() {
      return Padding(
        padding: EdgeInsets.all(10.px),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OperationItem(Icon(Icons.schedule), "${_mealModel.duration}分钟"),
            OperationItem(Icon(Icons.restaurant), _mealModel.complexStr),
            buildFavorItem()
          ],
        ),
      );
  }

  Widget buildFavorItem() {
    return Consumer<FavorViewModel>(
        builder: (ctx, favorVM, child) {
          final iconData = favorVM.isFavor(_mealModel) ? Icons.favorite : Icons.favorite_border;
          final favorColor = favorVM.isFavor(_mealModel) ? Colors.red : Colors.black;
          final title = favorVM.isFavor(_mealModel) ? "收藏" : "未收藏";

          return GestureDetector(
            child: OperationItem(Icon(iconData), title, textColor: favorColor),
            onTap: () {
              favorVM.handleMeal(_mealModel);
            },
          );
    });
  }

}
