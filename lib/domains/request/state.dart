import 'package:bloc_test/domains/friend/model/friend_model.dart';
import 'package:equatable/equatable.dart';

class FriendRequestState extends Equatable {}

class FriendRequestUninitialized extends FriendRequestState {
  @override
  String toString() {
    return "FriendRequestUninitialized";
  }
}

class FriendRequestLoadError extends FriendRequestState {
  @override
  String toString() {
    return "FriendRequestLoadError";
  }
}

class FriendRequestLoaded extends FriendRequestState {
  List<Person> requests;

  FriendRequestLoaded({
    this.requests
  });

  @override
  String toString() {
    return "FriendReqeustLoaded";
  }
}