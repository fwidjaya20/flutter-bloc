import 'package:equatable/equatable.dart';

class ContactEvent extends Equatable {}

class FetchContactList extends ContactEvent {
  @override
  String toString() {
    return "FetchContactList";
  }
}