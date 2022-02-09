part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final User? user;
  final DioError? error;

  const LoginState({this.user, this.error});

  @override
  List<Object?> get props => [user, error];
}

class LoginInit extends LoginState {
  const LoginInit();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginDone extends LoginState {
  const LoginDone(User user) : super(user: user);
}

class LoginError extends LoginState {
  const LoginError(DioError? error) : super(error: error);
}

class LoggedOut extends LoginState {
  const LoggedOut(User user) : super(user: user);
}
