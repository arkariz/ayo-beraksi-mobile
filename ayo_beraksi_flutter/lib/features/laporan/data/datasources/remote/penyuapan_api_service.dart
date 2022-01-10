import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/models/laporan_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'penyuapan_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class PenyuapanApiService {
  factory PenyuapanApiService(Dio dio, {String baseUrl}) = _PenyuapanApiService;

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
}
