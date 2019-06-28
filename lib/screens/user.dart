import 'package:bloc_test/domains/user/bloc/user_bloc.dart';
import 'package:bloc_test/domains/user/models/user.dart';
import 'package:bloc_test/domains/user/repositories/repository.dart';
import 'package:bloc_test/widgets/loading.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    userBloc.getUser();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("User Detail"),
      ),
      body: Container(
        child: StreamBuilder<UserRepository>(
          stream: userBloc.subject.stream,
          builder: (BuildContext context, AsyncSnapshot<UserRepository> snapshot) {
            if (snapshot.hasData) {
              return _buildUserWidget(snapshot.data);
            } else

            if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error);
            } else {
              return LoadingWidget();
            }
          },
        ),
      ),
    );
  }

  Widget _buildUserWidget(UserRepository user) {
    User u = user.getUsers()[0];
    return Center(
      child: Column(
        children: <Widget>[
          Image.network(u.picture.large),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: <Widget>[
                Text("${u.getFormattedName()}"),
                Text("${u.email}"),
                Text("${u.phone}"),
                Text("${u.gender}"),
                Text("${u.location.street} (${u.location.city})"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error occured: $error"),
          ],
        )
      );
  }

}