import 'package:flutter/material.dart';
import 'Project/pages/main/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          splashColor: Colors.red, //按钮点击渐变色颜色
          highlightColor: Colors.blue  //按钮高亮颜色
      ),
      home: HYMainPage(),
    );
  }
}
