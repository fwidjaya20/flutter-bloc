import 'package:bloc_test/commons/models/bottom_navigation/bottom_navigation.dart';
import 'package:bloc_test/screens/account.dart';
import 'package:bloc_test/screens/friend.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State<HomeScreen> {

  int _currentScreenIndex;
  var _screends = [];

  @override
  void initState() {
    super.initState();

    _currentScreenIndex = 0;
    _screends = [
      FriendScreen(),
      Text("Post's Screen"),
      AccountScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return _screends[_currentScreenIndex];
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigation(
      currentScreen: _currentScreenIndex,
      onTap: _handleBottomNavigationItemTabbed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          title: Text("Friends")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inbox),
          title: Text("Post")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text("Account")
        ),
      ]
    )
      .build();
  }

  _handleBottomNavigationItemTabbed(int index) {
    if (_currentScreenIndex != index) {
      setState(() {
        _currentScreenIndex = index;
      });
    }
  }

}