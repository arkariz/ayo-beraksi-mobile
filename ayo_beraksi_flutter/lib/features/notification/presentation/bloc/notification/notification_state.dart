part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  final List<Notification>? notifications;
  final Notification? notification;
  final String? error;
  final String? message;

  const NotificationState({this.notifications, this.notification, this.error, this.message});

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
  const SaveNotificationSuccess(Notification? notification) : super(notification: notification);
}

class SaveNotificationSuccessBg extends NotificationState {
  const SaveNotificationSuccessBg(Notification? notification) : super(notification: notification);
}

class SaveNotificationFailed extends NotificationState {
  const SaveNotificationFailed(String? error) : super(error: error);
}
