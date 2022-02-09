part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends LoginEvent {
  final Map<String, dynamic> auth;

  const GetUser(this.auth);
}

class CheckUserLogin extends LoginEvent {}

class DestroyToken extends LoginEvent {}
