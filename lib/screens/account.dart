import 'package:bloc_test/commons/widgets/headers/main_header_bar.dart';
import 'package:bloc_test/widgets/accounts/account_action.dart';
import 'package:bloc_test/widgets/accounts/account_summary.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            MainHeaderBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    AccountSummary(),
                    AccountAction()
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }

}