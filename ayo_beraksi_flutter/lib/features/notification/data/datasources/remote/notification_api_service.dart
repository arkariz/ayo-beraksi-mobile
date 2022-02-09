import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/models/fcm_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'notification_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class NotificationApiService {
  factory NotificationApiService(Dio dio, {String baseUrl}) = _NotificationApiService;

  @POST('/api/save-token')
  Future<HttpResponse<FcmModel>> postFcmToken(@Header('Authorization') String token, @Header('Accept') String? accept,
      @Header("Content-Type") String? type, @Body() Map<String, dynamic> body);
}
