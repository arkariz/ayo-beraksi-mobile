import 'package:hive/hive.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: 1)
class HiveUser extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? email;
  @HiveField(3)
  String? noTlp;
  @HiveField(4)
  String? nip;
  @HiveField(5)
  int? roleId;
  @HiveField(6)
  String? token;

  HiveUser(this.id, this.name, this.email, this.noTlp, this.nip, this.roleId, this.token);
}
