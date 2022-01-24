part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  final Fcm? message;
  final DioError? error;

  const NotificationState({this.message, this.error});

  @override
  List<Object?> get props => [message, error];
}

//Change Name
class PostFcmTokenInitial extends NotificationState {}

class PostFcmTokenSuccess extends NotificationState {
  const PostFcmTokenSuccess(Fcm? message) : super(message: message);
}

class PostFcmTokenFailed extends NotificationState {
  const PostFcmTokenFailed(DioError? error) : super(error: error);
}
