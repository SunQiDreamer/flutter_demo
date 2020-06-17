import 'package:flutter/material.dart';
import 'package:flutterapp/extension/int_extension.dart';
import 'package:flutterapp/food/core/viewmodel/filter_view_model.dart';
import 'package:provider/provider.dart';

class FilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildChoiceTitle(context),
        buildChioceSelect()
      ],
    );
  }

  Widget buildChoiceTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text(
        '展示你的选择',
        style: Theme.of(context)
            .textTheme
            .display3
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildChioceSelect() {
    return Expanded(
      child: Consumer<FilterViewModel>(
        builder: (ctx, filterVM, child) {
          return ListView(
            children: [
              buildListTile("无谷蛋白", "五谷蛋白", filterVM.isGlutenFree, (value) {
                filterVM.isGlutenFree = value;
              }),
              buildListTile("不含乳糖", "不含乳糖", filterVM.isLactoseFree, (value) {
                filterVM.isLactoseFree = value;
              }),
              buildListTile("素食主义", "素食主义", filterVM.isVegetarian, (value) {
                filterVM.isVegetarian = value;
              }),
              buildListTile("严格素食主义", "严格素食主义", filterVM.isVegan, (value) {
                filterVM.isVegan = value;
              })
            ],
          );
        },
      ),
    );
  }

  Widget buildListTile(String title, String subtitle, bool value, Function onChange) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(value: value, onChanged: onChange,),
    );
  }
}
