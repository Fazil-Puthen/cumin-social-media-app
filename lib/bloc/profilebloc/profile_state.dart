part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class DetailLoading extends ProfileState{}

class DetailsFetched extends ProfileState{
  final String name;
  final String email;

  DetailsFetched({
    required this.name,
    required this.email,
  });
}

class ErrorFetching extends ProfileState{
  final String message;

  ErrorFetching({
    required this.message,
  });
}
