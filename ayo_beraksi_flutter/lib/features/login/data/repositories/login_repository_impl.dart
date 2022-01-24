import 'dart:io';

import 'package:ayo_beraksi_flutter/features/login/data/datasources/local/user_local_data_source.dart';
import 'package:ayo_beraksi_flutter/features/login/data/datasources/remote/login_api_service.dart';
import 'package:ayo_beraksi_flutter/features/login/data/models/user_hive_model.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/entities/user.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/params/login_request.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/repositories/login_repository.dart';
import 'package:dio/dio.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApiService _loginApiService;
  final UserLocalDataSource _userLocalDataSource;

  const LoginRepositoryImpl(this._loginApiService, this._userLocalDataSource);

  @override
  Future<DataState<User>> getUser(LoginRequestParams? params) async {
    try {
      final httpResponse = await _loginApiService.getUser(params!.auth);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final user = httpResponse.data;
        final userModel = HiveUser(
          user.id!,
          user.name!,
          user.email!,
          user.noTlp!,
          user.nip,
          user.roleId!,
          user.token!,
        );

        _userLocalDataSource.cacheUser(userModel);

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
  Future<DataState<User>> getUserCache() async {
    final hiveUser = await _userLocalDataSource.getUserCache();

    try {
      if (hiveUser != null || hiveUser?.name != null) {
        final user = User(
          hiveUser!.name,
          hiveUser.id,
          hiveUser.email,
          hiveUser.noTlp,
          hiveUser.nip,
          hiveUser.roleId,
          hiveUser.token,
        );
        return DataSuccess(user);
      }
      return DataFailed(
        DioError(
          error: "empty",
          requestOptions: RequestOptions(path: "empty"),
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<String?>> deleteUser() async {
    await _userLocalDataSource.deleteUser();
    return const DataSuccess("delete item");
  }
}
