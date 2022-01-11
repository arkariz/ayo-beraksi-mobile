part of 'name_bloc.dart';

abstract class NameState extends Equatable {
  final ChangeNameMessage? message;
  final DioError? error;

  const NameState({this.message, this.error});

  @override
  List<Object?> get props => [message, error];
}

//Change Name
class ChangeNameInitial extends NameState {}

class ChangeNameSuccess extends NameState {
  const ChangeNameSuccess(ChangeNameMessage? message) : super(message: message);
}

class ChangeNameFailed extends NameState {
  const ChangeNameFailed(DioError? error) : super(error: error);
}
