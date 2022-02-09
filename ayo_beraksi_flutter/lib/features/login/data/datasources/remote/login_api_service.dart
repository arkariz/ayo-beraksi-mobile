import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/features/login/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String baseUrl}) = _LoginApiService;

  @POST('/api/login')
  Future<HttpResponse<UserModel>> getUser(@Body() Map<String, dynamic> body);
}
