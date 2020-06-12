import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/food/core/model/meal_model.dart';
import 'package:flutterapp/food/ui/page/detail/detail.dart';

class MealItem extends StatelessWidget {
  final MealModel _mealModel;
  MealItem(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
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

  }

  Widget buildOperationInfo() {

  }

  Widget buildFavorItem() {

  }

}
