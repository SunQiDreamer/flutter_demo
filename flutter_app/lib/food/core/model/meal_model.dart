import 'dart:convert';

List<String> complexes = ["简单", "中等", "困难"];

class MealModel {
  String id;
  List<String> catrgories;
  String title;
  int affordability;
  int complexity;
  String complexStr;
  String imageUrl;
  int duration;
  List<String> ingredients;
  List<String> steps;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoesFree;

  MealModel({
    this.id,
    this.catrgories,
    this.title,
    this.affordability,
    this.complexity,
    this.complexStr,
    this.imageUrl,
    this.duration,
    this.ingredients,
    this.steps,
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.isLactoesFree
});

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
    id: json["id"],
    catrgories: List<String>.from(json["categories"].map((x) => x)),
    title: json["title"],
    affordability: json["affordability"],
    complexity: json["complexity"],
    complexStr: complexes[json["complexity"]],
    imageUrl: json["imageUrl"],
    duration: json["duration"],
    ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    steps: List<String>.from(json["steps"].map((x) => x)),
    isGlutenFree: json["isGlutenFree"],
    isVegan: json["isVegan"],
    isVegetarian: json["isVegetarian"],
    isLactoesFree: json["isLactoseFree"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": List<dynamic>.from(catrgories.map((x) => x)),
    "title": title,
    "affordability": affordability,
    "complexity": complexity,
    "imageUrl": imageUrl,
    "duration": duration,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
    "steps": List<dynamic>.from(steps.map((x) => x)),
    "isGlutenFree": isGlutenFree,
    "isVegan": isVegan,
    "isVegetarian": isVegetarian,
    "isLactoseFree": isLactoesFree,
  };

}
