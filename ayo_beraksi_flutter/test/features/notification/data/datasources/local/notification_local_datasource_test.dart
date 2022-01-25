import 'package:ayo_beraksi_flutter/features/notification/data/datasources/local/hiveBox/notification_box.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/datasources/local/notification_local_datasource.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/models/notification_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

class MockNotificationBox extends Mock implements NotificationBox {}

class MockBox<T> extends Mock implements Box<T> {}

void main() {
  final notification1 = NotificationModel(1, "tes1", "tes1");
  final notification2 = NotificationModel(2, "tes2", "tes2");
  final notificationList = [notification1, notification2];

  group('Given a Loyalty cards repository', () async {
    final mockNotificationBox = MockNotificationBox();
    final mockBox = MockBox<NotificationModel>();

    final notificationLocalDataSourceImpl = NotificationLocalDataSourceImpl(mockNotificationBox);

    when(mockNotificationBox.box).thenAnswer((_) async => Future.value(mockBox));
    when(mockBox.values).thenReturn(notificationList);

    test('should retrieve all notification', () async {
      final result = await notificationLocalDataSourceImpl.getAll();

      expect(result, notificationList);
    });

    test('should save loyalty card in the box', () async {
      final newNotification = NotificationModel(3, 'tes3', 'tes3');

      await notificationLocalDataSourceImpl.save(newNotification);

      verify(mockBox.add(newNotification));
    });

    test('should delete loyalty card from the box', () async {
      final existingNotification = NotificationModel(3, 'tes3', 'tes3');

      await notificationLocalDataSourceImpl.delete(existingNotification);

      verify(mockBox.delete(existingNotification.key));
    });
  });
}
