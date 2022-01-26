import 'package:ayo_beraksi_flutter/core/params/notification_params.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/notification.dart';
import 'package:ayo_beraksi_flutter/features/notification/presentation/bloc/notification/notification_bloc.dart';
import 'package:ayo_beraksi_flutter/injector.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel channel;

  NotificationService._internal();

  Future<void> initNotification() async {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.max,
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(
    int id,
    String title,
    String body,
    int seconds,
    String channelId,
    String channelName,
  ) async {
    NotificationParams notification = NotificationParams(notification: Notification(id, title, body));
    NotificationBloc(injector(), injector()).add(SaveNotificationBg(notification));

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
      NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          channelName,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const IOSNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
