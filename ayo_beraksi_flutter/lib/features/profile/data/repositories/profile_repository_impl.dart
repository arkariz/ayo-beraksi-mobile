import 'dart:io';

import 'package:ayo_beraksi_flutter/core/params/profile_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/login/data/datasources/local/user_local_data_source.dart';
import 'package:ayo_beraksi_flutter/features/profile/data/datasources/profile_api_service.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/entities/change_name_message.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/entities/change_tlp.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/repositories/profile_repository.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApiService _profileApiService;
  final UserLocalDataSource _userLocalDataSource;

  ProfileRepositoryImpl(this._profileApiService, this._userLocalDataSource);

  @override
  Future<DataState<ChangeNameMessage>> changeName(ChangeProfileParams? params) async {
    try {
      final token = await _userLocalDataSource.getUserCache();

      final httpResponse =
          await _profileApiService.changeName("Bearer $token", "application/json", "application/json", params!.profile);

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
  Future<DataState<ChangeTelepon>> changeTelepon(ChangeProfileParams? params) async {
    try {
      final token = await _userLocalDataSource.getUserCache();

      final httpResponse = await _profileApiService.changeTelepon(
          "Bearer $token", "application/json", "application/json", params!.profile);

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
