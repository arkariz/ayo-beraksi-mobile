part of 'fcm_bloc.dart';

abstract class FcmState extends Equatable {
  final Fcm? message;
  final DioError? error;

  const FcmState({this.message, this.error});

  @override
  List<Object?> get props => [message, error];
}

class PostFcmTokenInitial extends FcmState {}

class PostFcmTokenSuccess extends FcmState {
  const PostFcmTokenSuccess(Fcm? message) : super(message: message);
}

class PostFcmTokenFailed extends FcmState {
  const PostFcmTokenFailed(DioError? error) : super(error: error);
}
