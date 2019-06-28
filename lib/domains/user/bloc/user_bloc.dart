import 'package:bloc_test/domains/user/repositories/repository.dart';
import 'package:bloc_test/domains/user/responses/user_response.dart';
import 'package:bloc_test/domains/user/services/user_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class UserBloc {
  UserRepository _userRepository = UserRepository();

  final UserService _service = UserService();
  final BehaviorSubject<UserRepository> _subject = BehaviorSubject<UserRepository>();

  BehaviorSubject<UserRepository> get subject => _subject;

  getUsers() async {
    UserResponse response = await _service.getUsers();

    _userRepository.setUsers(response);

    _subject.sink.add(_userRepository);
  }

  getUser() async {
    UserResponse response = await _service.getUser();

    _userRepository.setUsers(response);

    _subject.sink.add(_userRepository);
  }

  dispose() {
    _subject.close();
  }

}

final userBloc = UserBloc();