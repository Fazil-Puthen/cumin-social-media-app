part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignIn extends AuthEvent{
  final String email;
  final String password;

  SignIn({required this.email,
  required this.password});
}

class Signup extends AuthEvent{
  final String name;
  final String email;
  final String password;

  Signup({
    required this.name,
    required this.email,
    required this.password,
  });
}

class Signout extends AuthEvent{}

class Addemail extends AuthEvent{
 final String email;

  Addemail({
    required this.email,
  });
}