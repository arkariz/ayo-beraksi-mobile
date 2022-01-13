import 'package:ayo_beraksi_flutter/features/notification/domain/entities/fcm.dart';

class FcmModel extends Fcm {
  const FcmModel(String message) : super(message);

  factory FcmModel.fromJson(List json) {
    return FcmModel(
      json[0],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
