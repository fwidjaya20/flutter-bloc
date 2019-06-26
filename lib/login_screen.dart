import 'package:bloc_test/bloc/login/login_bloc.dart';
import 'package:bloc_test/bloc/user/user_bloc.dart';
import 'package:bloc_test/bloc/user/user_repository.dart';
import 'package:bloc_test/login_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  LoginScreen({
    Key key,
    @required this.userRepository
  }) : assert(userRepository != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        builder: (BuildContext context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: this.userRepository
          );
        },
        child: LoginForm(),
      ),
    );
  }

}