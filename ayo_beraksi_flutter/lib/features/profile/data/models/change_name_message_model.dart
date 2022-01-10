import 'package:ayo_beraksi_flutter/features/profile/domain/entities/change_name_message.dart';

class ChangeUsernameMessageModel extends ChangeNameMessage {
  const ChangeUsernameMessageModel(String name, String message) : super(name, message);

  factory ChangeUsernameMessageModel.fromJson(Map<String, dynamic> json) {
    return ChangeUsernameMessageModel(
      json['user']['name'],
      json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'message': message,
    };
  }
}
