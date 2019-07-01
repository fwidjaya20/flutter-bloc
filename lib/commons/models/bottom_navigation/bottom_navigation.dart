import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavigation {

  final List<BottomNavigationBarItem> items;
  final Function onTap;
  final int currentScreen;

  BottomNavigation({
    @required this.currentScreen,
    @required this.onTap,
    @required this.items
  });

  Widget build() {
    return BottomNavigationBar(
      currentIndex: currentScreen,
      onTap: onTap,
      items: items,
    );
  }

}