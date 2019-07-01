import 'package:bloc_test/domains/friend/model/friend_model.dart';
import 'package:equatable/equatable.dart';

class ContactState extends Equatable {}

class ContactUninitialized extends ContactState {
  @override
  String toString() {
    return "ContactUninitialized";
  }
}

class ContactLoadError extends ContactState {
  @override
  String toString() {
    return "ContactLoadError";
  }
}

class ContactLoaded extends ContactState {
  List<Person> friends;

  ContactLoaded({
    this.friends
  });

  @override
  String toString() {
    return "ContactLoaded";
  }
}