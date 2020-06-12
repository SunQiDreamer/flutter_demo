import 'package:flutterapp/Project/request/http_request.dart';
import 'package:flutterapp/food/core/model/meal_model.dart';

class MealRequest {
  static Future<List<MealModel>> getMealModel() async {
    final url = "/meal";
    final result = await HttpRequest.request(url);

    final mealArray = result["meal"];
    List<MealModel> meals = [];
    for (var json in mealArray) {
      meals.add(MealModel.fromJson(json));
    }
    return meals;
  }
}