import 'package:flutter/material.dart';
import 'package:flutterapp/food/ui/page/filter/filter_content.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = "/filter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食过滤"),
      ),
      body: FilterContent(),
    );
  }
}
