part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final User? user;
  final DioError? error;
  final bool? noMoreData;

  const LoginState({this.user, this.error, this.noMoreData});

  @override
  List<Object?> get props => [user, error, noMoreData];
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
