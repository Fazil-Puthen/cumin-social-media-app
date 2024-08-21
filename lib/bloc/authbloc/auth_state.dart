part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class SigninLoading extends AuthState{}

class SignupLoading extends AuthState{}

class SignupSuccess extends AuthState{}

class SigninSuccess extends AuthState{}

class SigninError extends AuthState{
  final String message;
  SigninError({
    required this.message
  });
}

class SignupError extends AuthState{
  final String message;
  SignupError({
    required this.message
  });
}

class SignoutSuccess extends AuthState{}

class SignoutError extends AuthState{
  final String message;

  SignoutError({
    required this.message
  });
}

