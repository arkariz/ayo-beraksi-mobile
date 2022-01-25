part of 'fcm_bloc.dart';

abstract class FcmEvent extends Equatable {
  const FcmEvent();

  @override
  List<Object> get props => [];
}

class PostFcmToken extends FcmEvent {
  final Map<String, dynamic> token;

  const PostFcmToken(this.token);
}

class ResetNotificationEvent extends FcmEvent {}
