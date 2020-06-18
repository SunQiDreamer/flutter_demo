import 'package:flutter/cupertino.dart';
import 'package:flutterapp/food/core/model/meal_model.dart';
import 'package:flutterapp/food/core/viewmodel/filter_view_model.dart';

class BaseMealViewModel extends ChangeNotifier{
  List<MealModel> _meals = [];

  FilterViewModel _filterViewModel;

  void updateFilters(FilterViewModel filterViewModel) {
    _filterViewModel = filterViewModel;
  }

  List<MealModel> get meals {
    return _meals.where((meal) {
      if (_filterViewModel.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterViewModel.isLactoseFree && !meal.isLactoesFree) return false;
      if (_filterViewModel.isVegetarian&& !meal.isVegetarian) return false;
      if (_filterViewModel.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<MealModel> get originMeals {
    return _meals;
  }

  set meals(List<MealModel> value) {
    _meals = value;
    notifyListeners();
  }

}