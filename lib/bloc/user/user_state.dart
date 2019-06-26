import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticateUninitialized extends AuthenticationState {
  @override
  String toString() {
    return 'AuthenticationUninitialized';
  }
}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}