import 'package:ayo_beraksi_flutter/core/params/login_request.dart';
import 'package:ayo_beraksi_flutter/core/params/no_params.dart';
import 'package:ayo_beraksi_flutter/core/params/notification_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/fcm.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/notification.dart';

abstract class NotificationRepository {
  Future<DataState<Fcm>> postFcmToken(LoginRequestParams? params);
  Future<DataState<String>> saveNotification(NotificationParams? params);
  Future<DataState<List<Notification>>> getAllNotification(NoParams? params);
  Future<DataState<List<Notification>>> updateNotification(UpdateNotificationParams? params);
}
