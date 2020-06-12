import 'package:flutterapp/food/core/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/extension/int_extension.dart';
import 'package:flutterapp/food/ui/page/meal/meal.dart';

class HomeCategoryItem extends StatelessWidget {
  final CategoryModel _categoryModel;
  HomeCategoryItem(this._categoryModel);

  @override
  Widget build(BuildContext context) {
    final bgColor = _categoryModel.cColor;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(MealScreen.routeName, arguments: _categoryModel);
      },
      child: Container(
        child: Text(
          _categoryModel.title,
          style: Theme.of(context).textTheme.headline3.copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              bgColor.withOpacity(.5),
              bgColor
            ]
          )
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
