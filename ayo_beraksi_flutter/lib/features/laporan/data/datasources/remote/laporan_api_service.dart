import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/models/feedback_model.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/models/gratifikasi_model.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/models/laporan_list_model.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/models/laporan_model.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/models/pengaduan_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'laporan_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class LaporanApiService {
  factory LaporanApiService(Dio dio, {String baseUrl}) = _LaporanApiService;

  @POST('/api/actions/laporan-penyuapan/add')
  Future<HttpResponse<LaporanModel>> addLaporanPenyuapan(@Header('Authorization') String? token,
      @Header('Accept') String? accept, @Header("Content-Type") String? type, @Body() Map<String, dynamic> body);

  @POST("/api/actions/laporan-pengaduan/add")
  Future<HttpResponse<PengaduanModel>> addLaporanPengaduan(@Header('Authorization') String? token,
      @Header('Accept') String? accept, @Header("Content-Type") String? type, @Body() Map<String, dynamic> body);

  @POST("/api/actions/laporan-gratifikasi/add")
  Future<HttpResponse<GratifikasiModel>> addLaporanGratifikasi(@Header('Authorization') String? token,
      @Header('Accept') String? accept, @Header("Content-Type") String? type, @Body() Map<String, dynamic> body);

  @POST("/api/feedback/add")
  Future<HttpResponse<FeedbackModel>> addFeedback(
      @Header('Accept') String? accept, @Header("Content-Type") String? type, @Body() Map<String, dynamic> body);

  @GET("/api/actions/laporan/get-list/all")
  Future<HttpResponse<LaporanListModel>> getLaporanList(
      @Header('Authorization') String? token, @Header('Accept') String? accept, @Header("Content-Type") String? type);
}
