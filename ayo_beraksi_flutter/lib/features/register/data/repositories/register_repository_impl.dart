import 'dart:io';

import 'package:ayo_beraksi_flutter/features/register/data/datasources/remote/register_api_service.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/params/register_request.dart';
import 'package:ayo_beraksi_flutter/features/register/domain/repositories/register_repository.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterApiService _registerApiService;

  RegisterRepositoryImpl(this._registerApiService);

  @override
  Future<DataState<HttpResponse>> postRegister(RegisterRequestParams? params) async {
    try {
      final httpResponse = await _registerApiService.postRegister(params!.auth);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse);
      }
      // if (httpResponse.data['message'] == "Email Sudah digunakan") {
      //   return DataFailed(
      //     DioError(
      //         error: httpResponse.data['message'],
      //         response: httpResponse.response,
      //         requestOptions: httpResponse.response.requestOptions,
      //         type: DioErrorType.response),
      //   );
      // }
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
