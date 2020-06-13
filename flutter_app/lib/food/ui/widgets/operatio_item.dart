import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/extension/int_extension.dart';

class OperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  final Color textColor;

  OperationItem(this._icon, this._title, {this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _icon,
          Text(_title, style: TextStyle(color: textColor),)
        ],
      ),


    );
  }
}
