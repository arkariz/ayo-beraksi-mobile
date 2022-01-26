part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class SaveNotificationEvent extends NotificationEvent {
  final NotificationParams notification;

  const SaveNotificationEvent(this.notification);
}

class SaveNotificationBg extends NotificationEvent {
  final NotificationParams notification;

  const SaveNotificationBg(this.notification);
}

class GetAllNotificationEvent extends NotificationEvent {}
