import 'package:bloc_test/domains/contact/bloc.dart';
import 'package:bloc_test/domains/contact/event.dart';
import 'package:bloc_test/domains/contact/state.dart';
import 'package:bloc_test/domains/friend/model/friend_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ContactScreenState();
  }

}

class _ContactScreenState extends State<ContactScreen> {
  GlobalKey<ScaffoldState> _globalKey;
  ContactBloc _contactBloc;

  @override
  void initState() {
    super.initState();

    _globalKey = GlobalKey<ScaffoldState>();
    _contactBloc = ContactBloc();

    _contactBloc.dispatch(FetchContactList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: BlocBuilder<ContactEvent, ContactState>(
        bloc: _contactBloc,
        builder: (BuildContext context, ContactState state) {
          if (state is ContactUninitialized) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ContactLoaded) {
            return _renderContactList(state.friends);
          }

          if (state is ContactLoadError) {
            return Center(
              child: Text("Data Error Bro"),
            );
          }
        },
      ),
    );
  }

  Widget _renderContactList(List<Person> contacts) {
    if ( contacts.length > 0 ) {
      return ListView.separated(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          Person p = contacts.elementAt(index);

          return ListTile(
            onTap: () => _handleContactTapped(p),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(p.picture),
              backgroundColor: Colors.transparent,
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
        child: Text("No Contact Yet"),
      );
    }
  }

  void _handleContactTapped(Person p) {
    print(p.id);
  }

  @override
  void dispose() {
    super.dispose();
  }

}