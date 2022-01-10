import 'package:ayo_beraksi_flutter/features/login/domain/entities/user.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/entities/change_name_message.dart';

class ChangeUsernameMessageModel extends ChangeNameMessage {
  const ChangeUsernameMessageModel(String message) : super(message);

  factory ChangeUsernameMessageModel.fromJson(Map<String, dynamic> json) {
    return ChangeUsernameMessageModel(
      json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
