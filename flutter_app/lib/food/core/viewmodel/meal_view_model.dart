import 'package:flutterapp/food/core/service/meal_request.dart';
import 'package:flutterapp/food/core/viewmodel/base_view_model.dart';

class MealViewModel extends BaseMealViewModel {
  MealViewModel() {
    MealRequest.getMealModel().then((value) {
      meals = value;
    });
  }
}