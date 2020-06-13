import 'package:flutterapp/food/core/model/meal_model.dart';
import 'package:flutterapp/food/core/viewmodel/base_view_model.dart';

class FavorViewModel extends BaseMealViewModel {
  void addMeal(MealModel meal) {
    originMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(MealModel meal) {
    originMeals.remove(meal);
    notifyListeners();
  }

  void handleMeal(MealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }

  bool isFavor(MealModel meal) {
    return originMeals.contains(meal);
  }
}
