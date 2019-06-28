import 'package:bloc_test/domains/user/bloc/user_bloc.dart';
import 'package:bloc_test/domains/user/models/user.dart';
import 'package:bloc_test/domains/user/repositories/repository.dart';
import 'package:bloc_test/widgets/loading.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    userBloc.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.white,
            onPressed: userBloc.getUsers,
          )
        ],
      ),
      body: Container(
        child: StreamBuilder<UserRepository>(
        stream: userBloc.subject.stream,
        builder: (BuildContext context, AsyncSnapshot<UserRepository> snapshot) {
          if (snapshot.hasData) {
            return _buildUserWidget(context, snapshot.data);
          } else
          if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error);
          } else {
            return LoadingWidget();
          }
        },
      ),
      )
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

  Widget _buildUserWidget(BuildContext context, UserRepository data) {
    if (data.getUsers().length == 0) {
      return _buildEmptyWidget(context);
    }

    return ListView.separated(
      itemCount: data.getUsers().length,
      itemBuilder: (BuildContext context, index) {
        User user = data.getUsers()[index];

        return ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(user.picture.thumbnail),
            backgroundColor: Colors.transparent,
          ),
          title: Text(user.getFormattedName()),
          subtitle: Text(user.email),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: _handleListClicked
        );
      },
      separatorBuilder: (BuildContext context, index) {
        return Divider();
      },
    );
  }

  Widget _buildEmptyWidget(BuildContext context) {
    return Center(
      child: Text("No Data Available!"),
    );
  }
  
  void _handleListClicked() {
    Navigator.pushNamed(context, '/user');
  }

  @override
  void dispose() {
    super.dispose();
  }

}