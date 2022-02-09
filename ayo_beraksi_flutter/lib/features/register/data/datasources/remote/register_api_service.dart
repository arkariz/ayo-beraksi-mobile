import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'register_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class RegisterApiService {
  factory RegisterApiService(Dio dio, {String baseUrl}) = _RegisterApiService;

  @POST('/api/register')
  Future<HttpResponse> postRegister(@Body() Map<String, dynamic> body);
}
