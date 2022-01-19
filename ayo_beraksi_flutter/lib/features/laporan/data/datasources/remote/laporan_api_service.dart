import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/models/feedback_model.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/models/gratifikasi_model.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/models/laporan_model.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/models/pengaduan_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'laporan_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class LaporanApiService {
  factory LaporanApiService(Dio dio, {String baseUrl}) = _LaporanApiService;

  @POST(
      '/api/actions/laporan-penyuapan/add?jabatan={jabatan}&instansi={instansi}&kasus_suap={kasus_suap}&lokasi={lokasi}&tanggal_kejadian={tanggal_kejadian}&kronologis_kejadian={kronologis_kejadian}&id_pelapor={id_pelapor}&nama_terlapor={nama_terlapor}&nilai_suap={nilai_suap}')
  Future<HttpResponse<LaporanModel>> addLaporanPenyuapan({
    @Header('Authorization') String? token,
    @Header('Accept') String? accept,
    @Header("Content-Type") String? type,
    @Path("jabatan") String? jabatan,
    @Path("instansi") String? instansi,
    @Path("kasus_suap") String? kasusSuap,
    @Path("lokasi") String? lokasi,
    @Path("tanggal_kejadian") String? tanggalKejadian,
    @Path("kronologis_kejadian") String? kronologisKejadian,
    @Path("id_pelapor") int? idPelapor,
    @Path("nama_terlapor") String? namaTerlapor,
    @Path("nilai_suap") String? nilaiSuap,
  });

  @POST("/api/actions/laporan-pengaduan/add")
  Future<HttpResponse<PengaduanModel>> addLaporanPengaduan(@Header('Authorization') String? token,
      @Header('Accept') String? accept, @Header("Content-Type") String? type, @Body() Map<String, dynamic> body);

  @POST("/api/actions/laporan-gratifikasi/add")
  Future<HttpResponse<GratifikasiModel>> addLaporanGratifikasi(@Header('Authorization') String? token,
      @Header('Accept') String? accept, @Header("Content-Type") String? type, @Body() Map<String, dynamic> body);

  @POST("/api/feedback/add")
  Future<HttpResponse<FeedbackModel>> addFeedback(
      @Header('Accept') String? accept, @Header("Content-Type") String? type, @Body() Map<String, dynamic> body);
}
