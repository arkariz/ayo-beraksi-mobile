import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/datasources/local/hiveBox/notification_box.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/datasources/local/notification_local_datasource.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/models/notification_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void initialiseHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<NotificationModel>(NotificationModelAdapter());

  //Always starts from a clean box
  Hive.deleteBoxFromDisk(CACHED_NOTIFICATION);
}

void main() async {
  initialiseHive();

  final newNotification = NotificationModel(0, "tes0", "tes0");

  group('Given a real notification local datasource instance and a real Hive box', () {
    test('should save and then retrieve saved notification from the local datasource', () async {
      final notificationLocalDataSourceImpl = NotificationLocalDataSourceImpl(NotificationBox());

      await notificationLocalDataSourceImpl.save(newNotification);

      expect(await notificationLocalDataSourceImpl.getAll(), [newNotification]);
    });
  });
}
