import 'package:bloc_test/styles/colors.dart';
import 'package:flutter/material.dart';

class AccountSummary extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black12
      ),
      child: Stack(
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
            height: 210.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 64.0,
                      height: 64.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        border: Border.all(
                          color: BaseColor.borderGrey
                        )
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    _buildAccountInformation()
                  ],
                ),
                _buildAccountAction()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAccountInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Fredrick Widjaya",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: BaseColor.txtWhite
          ),
        ),
        SizedBox(height: 4.0,),
        Text(
          "ID USR-20190629-01",
          style: TextStyle(
            fontSize: 14.0,
            color: BaseColor.txtWhite
          ),
        )
      ],
    );
  }

  Widget _buildAccountAction() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 24.0
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
                padding: EdgeInsets.only(
                  right: 10.0
                ),
                child: GestureDetector(
                  onTap: () => print("Task Done Pressed!"),
                  child: Container(
                    color: Colors.transparent,
                    child: _buildTile(Icons.people, "Friends", "25"),
                ),
              )
            )
          ),
          Flexible(
            flex: 1,
            child: Container(
                padding: EdgeInsets.only(
                  right: 10.0
                ),
                child: GestureDetector(
                  onTap: () => print("My Balance Pressed!"),
                  child: Container(
                    color: Colors.transparent,
                    child: _buildTile(Icons.account_balance_wallet, "My Balance", "75.000"),
                ),
              )
            )
          )
        ],
      ),
    );
  }

  Widget _buildTile(IconData icon, String title, String summary) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Icon(icon, color: BaseColor.txtWhite)
            ),
            SizedBox(
              width: 5,
            ),
            Flexible(
              flex: 2,
              child: Text(title.toUpperCase(),
                style: TextStyle(
                  fontSize: 12.0,
                  color: BaseColor.txtWhite,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.left
              ),
            )
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Text(summary,
          style: TextStyle(
            fontSize: 24.0,
            color: BaseColor.txtWhite,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center
        )
      ],
    );
  }

}