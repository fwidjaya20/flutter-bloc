import 'package:bloc_test/styles/colors.dart';
import 'package:flutter/material.dart';

class AccountAction extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: () => print("Logout Clicked!"),
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0
                    ),
                    child: Icon(Icons.exit_to_app)
                  ),
                  Text("Logout",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: BaseColor.txtGrey3
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}