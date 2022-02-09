import 'package:ayo_beraksi_flutter/features/profile/domain/entities/change_tlp.dart';

class ChangeTeleponModel extends ChangeTelepon {
  const ChangeTeleponModel(String telepon, String message) : super(telepon, message);

  factory ChangeTeleponModel.fromJson(Map<String, dynamic> json) {
    return ChangeTeleponModel(
      json['user']['no_telp'],
      json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'no_telp': noTlp,
      'message': message,
    };
  }
}
