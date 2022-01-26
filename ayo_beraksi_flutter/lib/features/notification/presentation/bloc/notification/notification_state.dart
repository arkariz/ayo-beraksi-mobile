part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  final List<Notification>? notifications;
  final String? error;
  final String? message;

  const NotificationState({this.notifications, this.error, this.message});

  @override
  List<Object?> get props => [notifications, error, message];
}

class GetNotificationInitial extends NotificationState {}

class GetNotificationSuccess extends NotificationState {
  const GetNotificationSuccess(List<Notification>? notifications) : super(notifications: notifications);
}

class GetNotificationFailed extends NotificationState {
  const GetNotificationFailed(String? error) : super(error: error);
}

class SaveNotificationInitial extends NotificationState {}

class SaveNotificationSuccess extends NotificationState {
  const SaveNotificationSuccess(String? message) : super(message: message);
}

class SaveNotificationFailed extends NotificationState {
  const SaveNotificationFailed(String? error) : super(error: error);
}
