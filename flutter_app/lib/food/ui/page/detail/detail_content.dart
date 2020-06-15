import 'package:flutter/material.dart';
import 'package:flutterapp/food/core/model/meal_model.dart';
import 'package:flutterapp/extension/int_extension.dart';

class DetailContent extends StatelessWidget {
  final MealModel mealModel;
  DetailContent(this.mealModel);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildBannerImage(),
          buildMakeTitle(context, "制作材料"),
          buildMakeMaterial(context),
          buildMakeTitle(context, "制作步骤"),
          buildMakesSteps(context)
        ],
      ),
    );
  }

  Widget buildBannerImage() {
    return Container(
      width: double.infinity,
      child: Image.network(mealModel.imageUrl),
    );
  }

  Widget buildMakeMaterial(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(mealModel.ingredients[index]),
            ),
          );
        },
        itemCount: mealModel.ingredients.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget buildMakesSteps(BuildContext context) {
    return buildMakeContent(
        context: context,
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text("#${index + 1}"),
              ),
              title: Text(mealModel.steps[index]),
            );
          },
          itemCount: mealModel.steps.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (ctx, index) {
            return Divider();
          },
        ),
    );
  }

  Widget buildMakeTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Text(title, style: Theme.of(context).textTheme.display3.copyWith(fontWeight: FontWeight.bold),),
    );
  }

  Widget buildMakeContent({BuildContext context, Widget child}) {
    return Container(
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.px)
      ),
      width: MediaQuery.of(context).size.width - 30.px,
      child: child,
    );
  }
}
