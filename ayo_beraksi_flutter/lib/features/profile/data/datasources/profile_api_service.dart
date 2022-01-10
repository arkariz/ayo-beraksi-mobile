import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/features/profile/data/models/change_name_message_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'profile_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String baseUrl}) = _ProfileApiService;

  @POST('/api/ganti/nama')
  Future<HttpResponse<ChangeUsernameMessageModel>> changeName(@Header('Authorization') String token,
      @Header('Accept') String? accept, @Header("Content-Type") String? type, @Body() Map<String, dynamic> body);
}
