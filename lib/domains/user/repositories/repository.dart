import 'package:bloc_test/domains/user/models/user.dart';
import 'package:bloc_test/domains/user/responses/user_response.dart';

class UserRepository {

  UserResponse _users;

  void setUsers(UserResponse users) {
    this._users = users;
  }

  List<User> getUsers() {
    return _users.users.toList();
  }

}