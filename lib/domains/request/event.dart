import 'package:equatable/equatable.dart';

class FriendRequestEvent extends Equatable {}

class FetchFriendRequestedList extends FriendRequestEvent {
  @override
  String toString() {
    return "FetchFriendReqeustedList";
  }
}