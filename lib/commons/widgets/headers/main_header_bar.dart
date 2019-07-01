import 'package:bloc_test/styles/colors.dart';
import 'package:flutter/material.dart';

class MainHeaderBar extends StatelessWidget {

  final double height;

  MainHeaderBar({
    this.height = 80.0
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                BaseColor.linearGradientGreenStart1,
                BaseColor.linearGradientGreenEnd1
              ]
            )
          ),
          height: height,
        ),
        Container(
          padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Flutter Application",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        )
      ],
    );
  }

}