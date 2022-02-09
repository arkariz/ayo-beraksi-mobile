import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/models/notification_model.dart';
import 'package:hive/hive.dart';

class NotificationBox {
  var box = Hive.openBox<NotificationModel>(CACHED_NOTIFICATION);
}
