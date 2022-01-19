import 'dart:io';

import 'package:ayo_beraksi_flutter/core/params/login_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/login/data/datasources/local/user_local_data_source.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/datasources/notification_api_service.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/fcm.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/repositories/notification_repository.dart';
import 'package:dio/dio.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationApiService _notificationApiService;
  final UserLocalDataSource _userLocalDataSource;

  NotificationRepositoryImpl(this._notificationApiService, this._userLocalDataSource);

  @override
  Future<DataState<Fcm>> postFcmToken(LoginRequestParams? params) async {
    try {
      final token = await _userLocalDataSource.getUserCache();

      final httpResponse = await _notificationApiService.postFcmToken(
          "Bearer ${token!.token}", "application/json", "application/json", params!.auth);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
            type: DioErrorType.response),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
