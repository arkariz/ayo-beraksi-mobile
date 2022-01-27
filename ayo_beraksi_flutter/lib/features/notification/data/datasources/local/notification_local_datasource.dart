import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/models/notification_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

// abstract class NotificationLocalDataSource<T extends HiveObject> {
//   Future<void> save(T newObject);

//   Future<void> delete(T objectToDelete);

//   Future<List<T>> getAll();
// }

abstract class NotificationLocalDataSource {
  Future<void> save(NotificationModel newObject);

  Future<void> delete(NotificationModel objectToDelete);

  Future<List<NotificationModel>> getAll();

  Future<List<NotificationModel>> updateNotification(int index, NotificationModel value);
}

class NotificationLocalDataSourceImpl implements NotificationLocalDataSource {
  @override
  Future<void> delete(NotificationModel objectToDelete) async {
    var box = await Hive.openBox<NotificationModel>(CACHED_NOTIFICATION);
    box.delete(objectToDelete);
  }

  @override
  Future<List<NotificationModel>> getAll() async {
    var box = await Hive.openBox<NotificationModel>(CACHED_NOTIFICATION);
    return box.values.toList();
  }

  @override
  Future<void> save(NotificationModel newObject) async {
    var box = await Hive.openBox<NotificationModel>(CACHED_NOTIFICATION);
    box.add(newObject);
  }

  @override
  Future<List<NotificationModel>> updateNotification(index, value) async {
    var box = await Hive.openBox<NotificationModel>(CACHED_NOTIFICATION);
    box.putAt(index, value);
    return box.values.toList();
  }
}
