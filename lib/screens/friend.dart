import 'package:bloc_test/commons/models/tab_bars/tab_bar.dart';
import 'package:bloc_test/commons/widgets/tab_bars/tab_bar.dart';
import 'package:bloc_test/screens/contact.dart';
import 'package:bloc_test/screens/request.dart';
import 'package:flutter/material.dart';

class FriendScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TopTabBar(
      data: TabBarModel(
        title: "Your Friends",
        tabItems: <TabBarItemModel>[
          TabBarItemModel(title: "Contact's", body: ContactScreen()),
          TabBarItemModel(title: "Request's", body: RequestScreen()),
        ]
      ),
    );
  }

}