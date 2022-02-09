import 'package:hive/hive.dart';

part 'notification_model.g.dart';

@HiveType(typeId: 4)
class NotificationModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? body;

  @HiveField(3)
  DateTime dateTime;

  @HiveField(4)
  bool isRead = false;

  NotificationModel(this.id, this.title, this.body, this.dateTime, this.isRead);
}
