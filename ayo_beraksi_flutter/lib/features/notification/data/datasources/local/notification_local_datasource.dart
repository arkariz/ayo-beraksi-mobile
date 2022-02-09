import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/datasources/local/hiveBox/notification_box.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/models/notification_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class NotificationLocalDataSource<T extends HiveObject> {
  Future<void> save(T newObject);

  Future<void> delete();

  Future<List<T>> getAll();

  Future<List<NotificationModel>> updateNotification(int index, T object);
}

// abstract class NotificationLocalDataSource {
//   Future<void> save(NotificationModel newObject);

//   Future<void> delete(NotificationModel objectToDelete);

//   Future<List<NotificationModel>> getAll();

//   Future<List<NotificationModel>> updateNotification(int index, NotificationModel value);
// }

class NotificationLocalDataSourceImpl implements NotificationLocalDataSource<NotificationModel> {
  late NotificationBox notificationBox;

  NotificationLocalDataSourceImpl(this.notificationBox);

  @override
  Future<void> delete() async {
    final box = await notificationBox.box;
    // box.delete(objectToDelete);
    box.clear();
  }

  @override
  Future<List<NotificationModel>> getAll() async {
    final box = await notificationBox.box;
    return box.values.toList();
  }

  @override
  Future<void> save(NotificationModel newObject) async {
    final box = await notificationBox.box;
    box.add(newObject);
  }

  @override
  Future<List<NotificationModel>> updateNotification(index, value) async {
    final box = await notificationBox.box;
    box.putAt(index, value);
    return box.values.toList();
  }
}
