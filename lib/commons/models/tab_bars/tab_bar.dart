import 'package:flutter/material.dart';

class TabBarModel {
  List<TabBarItemModel> tabItems;
  String title;

  TabBarModel({
    @required this.tabItems,
    this.title = ''
  });
}

class TabBarItemModel {
  String title;
  Widget body;

  TabBarItemModel({
    @required this.title,
    @required this.body
  });
}