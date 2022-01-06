import 'package:ayo_beraksi_flutter/features/login/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(int id, String name, String email, String noTlp, String nip, int roleId)
      : super(name, id, email, noTlp, nip, roleId);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> user = json['user'];
    return UserModel(user['id'], user['name'], user['email'], user['no_telp'], user['nip'], user['role_id']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'no_tlp': noTlp, 'nip': nip, 'roleId': roleId};
  }
}
