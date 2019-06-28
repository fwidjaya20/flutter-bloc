import 'package:bloc_test/domains/user/models/user.dart';

class UserResponse {

  final List<User> users;
  final String error;

  UserResponse({this.users, this.error});

  UserResponse.fromJson(Map<String,dynamic> json) :
    users = (json["results"] as List).map((i) {
      return User.fromJson(i);
    }).toList(),
    error = "";

  UserResponse.withError(String error) :
    users = List(),
    error = error;

}