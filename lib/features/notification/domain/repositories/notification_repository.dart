import 'package:ayo_beraksi_flutter/core/params/login_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/fcm.dart';

abstract class NotificationRepository {
  Future<DataState<Fcm>> postFcmToken(LoginRequestParams? params);
}
