part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  final ChangeNameMessage? message;
  final DioError? error;

  const ProfileState({this.message, this.error});

  @override
  List<Object?> get props => [message, error];
}

class ChangeNameInitial extends ProfileState {}

class ChangeNameSuccess extends ProfileState {
  const ChangeNameSuccess(ChangeNameMessage? message) : super(message: message);
}

class ChangeNameFailed extends ProfileState {
  const ChangeNameFailed(DioError? error) : super(error: error);
}
