import 'package:flutter/material.dart';
import 'package:flutterapp/food/ui/page/favor/favor_content.dart';

class FavorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: FavorContent(),
    );
  }
}
