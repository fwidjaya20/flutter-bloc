import 'package:bloc_test/screens/home.dart';
import 'package:bloc_test/screens/user.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => HomeScreen(),
        '/user': (BuildContext context) => UserScreen()
      },
    );
  }
}
