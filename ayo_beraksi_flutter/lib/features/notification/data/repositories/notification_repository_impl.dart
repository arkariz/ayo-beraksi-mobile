import 'dart:io';

import 'package:ayo_beraksi_flutter/core/params/login_request.dart';
import 'package:ayo_beraksi_flutter/core/params/no_params.dart';
import 'package:ayo_beraksi_flutter/core/params/notification_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/login/data/datasources/local/user_local_data_source.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/datasources/local/notification_local_datasource.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/datasources/remote/notification_api_service.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/models/notification_model.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/fcm.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/notification.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/repositories/notification_repository.dart';
import 'package:dio/dio.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationApiService _notificationApiService;
  final UserLocalDataSource _userLocalDataSource;
  final NotificationLocalDataSource<NotificationModel> _notificationLocalDataSource;

  NotificationRepositoryImpl(
      this._notificationApiService, this._userLocalDataSource, this._notificationLocalDataSource);

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

  @override
  Future<DataState<String>> saveNotification(NotificationParams? params) async {
    final notification = params!.notification;
    final notificationModel = NotificationModel(
      notification.id,
      notification.title,
      notification.body,
      notification.dateTime,
      false,
    );
    _notificationLocalDataSource.save(notificationModel);
    return const DataSuccess("success");
  }

  @override
  Future<DataState<List<Notification>>> getAllNotification(NoParams? params) async {
    final notificationModel = await _notificationLocalDataSource.getAll();
    final List<Notification> result = [];

    for (var i in notificationModel) {
      final notificaton = Notification(i.id!, i.title!, i.body!, i.dateTime, i.isRead);
      result.add(notificaton);
    }

    return DataSuccess(result.reversed.toList());
  }

  @override
  Future<DataState<List<Notification>>> updateNotification(UpdateNotificationParams? params) async {
    final notification = params!.notification;
    final notificationModel = NotificationModel(
      notification.id,
      notification.title,
      notification.body,
      notification.dateTime,
      notification.isRead,
    );

    final allNotification = await _notificationLocalDataSource.updateNotification(params.index, notificationModel);
    final List<Notification> result = [];

    if (allNotification.isEmpty) {
      return DataSuccess(result);
    } else {
      for (var i in allNotification) {
        final notificaton = Notification(i.id!, i.title!, i.body!, i.dateTime, i.isRead);
        result.add(notificaton);
      }

      return DataSuccess(result.reversed.toList());
    }
  }

  @override
  Future<DataState<String>> deleteNotification(NoParams? params) async {
    _notificationLocalDataSource.delete();
    return const DataSuccess("Delete Success");
  }
}
