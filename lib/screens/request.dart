import 'package:bloc_test/domains/friend/model/friend_model.dart';
import 'package:bloc_test/domains/request/bloc.dart';
import 'package:bloc_test/domains/request/event.dart';
import 'package:bloc_test/domains/request/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RequestScreenState();
  }
}

class _RequestScreenState extends State<RequestScreen> {
  GlobalKey<ScaffoldState> _globalKey;
  FriendRequestBloc _friendRequestBloc;

  @override
  void initState() {
    super.initState();

    _globalKey = GlobalKey<ScaffoldState>();
    _friendRequestBloc = FriendRequestBloc();
    
    _friendRequestBloc.dispatch(FetchFriendRequestedList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: BlocBuilder<FriendRequestEvent, FriendRequestState>(
        bloc: _friendRequestBloc,
        builder: (BuildContext context, FriendRequestState state) {
          if (state is FriendRequestUninitialized) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FriendRequestLoaded) {
            return _renderRequestList(state.requests);
          }

          if (state is FriendRequestLoadError) {
            return Center(
              child: Text("Data Error Bro"),
            );
          }
        },
      ),
    );
  }

  Widget _renderRequestList(List<Person> friends) {
    if (friends.length > 0) {
      return ListView.separated(
        itemCount: friends.length,
        itemBuilder: (BuildContext context, int index) {
          Person p = friends.elementAt(index);

          return ListTile(
            onTap: () => this._handleFriendReqeustTapped(p),
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(p.picture),
            ),
            title: Text(p.name),
            subtitle: Text(p.email),
            trailing: Icon(Icons.keyboard_arrow_right),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      );
    } else {
      return Center(
        child: Text("No Friend Request"),
      );
    }
  }

  void _handleFriendReqeustTapped(Person p) {
    print(p.id);
  }

  @override
  void dispose() {
    super.dispose();
  }

}