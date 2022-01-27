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

class UpdateNotificationEvent extends NotificationEvent {
  final UpdateNotificationParams notification;

  const UpdateNotificationEvent(this.notification);
}

class GetAllNotificationEvent extends NotificationEvent {}

class NotificationInitial extends NotificationEvent {}
