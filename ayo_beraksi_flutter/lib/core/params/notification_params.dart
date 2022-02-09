import 'package:ayo_beraksi_flutter/features/notification/domain/entities/notification.dart';

class NotificationParams {
  final Notification notification;

  const NotificationParams({required this.notification});
}

class UpdateNotificationParams {
  final int index;
  final Notification notification;

  const UpdateNotificationParams({required this.index, required this.notification});
}
