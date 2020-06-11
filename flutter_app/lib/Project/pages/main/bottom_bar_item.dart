
import 'package:flutter/material.dart';

class HYBottomBarItem extends BottomNavigationBarItem {
 HYBottomBarItem(String iconName, String title)  
  : super (
   title: Text(title),
   icon: Image.asset(""),
   activeIcon: Image.asset("")
 );
}