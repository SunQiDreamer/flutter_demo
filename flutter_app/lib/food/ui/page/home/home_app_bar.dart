import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {
  HomeAppBar(BuildContext context): super(
    title: Text("美食广场"),
    leading: IconButton(
      icon: Icon(Icons.build),
      onPressed: () {

      },
    ),
  );
}