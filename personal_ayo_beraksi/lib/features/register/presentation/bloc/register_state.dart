part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  final HttpResponse? response;
  final DioError? error;

  const RegisterState({this.response, this.error});

  @override
  List<Object?> get props => [response, error];
}

class RegisterInit extends RegisterState {
  const RegisterInit();
}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess(HttpResponse? response) : super(response: response);
}

class RegisterFailed extends RegisterState {
  const RegisterFailed(DioError? error) : super(error: error);
}
