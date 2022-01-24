import 'package:ayo_beraksi_flutter/core/params/register_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:retrofit/dio.dart';

abstract class RegisterRepository {
  Future<DataState<HttpResponse>> postRegister(RegisterRequestParams? params);
}
