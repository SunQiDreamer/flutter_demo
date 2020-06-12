import 'package:flutter/material.dart';
import 'package:flutterapp/food/core/model/category_model.dart';
import 'package:flutterapp/food/core/service/JsonParse.dart';
import 'package:flutterapp/extension/int_extension.dart';
import 'package:flutterapp/food/ui/page/home/home_category_item.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: JsonParse.getCategoryData(),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        if (snapshot.error != null) return Center(child: Text('请求失败'));

        final categories = snapshot.data;
        return GridView.builder(
            padding: EdgeInsets.all(20),
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (ctx, index) {
              return HomeCategoryItem(categories[index]);
            });
      },
    );
  }
}
