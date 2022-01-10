import 'dart:io';

import 'package:ayo_beraksi_flutter/features/laporan/data/datasources/remote/penyuapan_api_service.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/params/add_laporan_request.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/repositories/penyuapan_repository.dart';
import 'package:ayo_beraksi_flutter/features/login/data/datasources/local/user_local_data_source.dart';
import 'package:dio/dio.dart';

class PenyuapanRepositoryImpl implements PenyuapanRepository {
  final PenyuapanApiService _penyuapanApiService;
  final UserLocalDataSource _userLocalDataSource;

  PenyuapanRepositoryImpl(this._userLocalDataSource, this._penyuapanApiService);

  @override
  Future<DataState<Laporan>> addLaporanPenyuapan(AddLaporanRequestParams? params) async {
    try {
      final token = await _userLocalDataSource.getUserCache();
      final laporan = params!.laporan;
      final httpResponse = await _penyuapanApiService.addLaporanPenyuapan(
          token: "Bearer $token",
          accept: "application/json",
          type: "application/json",
          jabatan: laporan['jabatan'],
          instansi: laporan['instansi'],
          kasusSuap: laporan['kasus_suap'],
          lokasi: laporan['lokasi'],
          tanggalKejadian: laporan['tanggal_kejadian'],
          kronologisKejadian: laporan['kronologis_kejadian'],
          idPelapor: laporan['id_pelapor'],
          namaTerlapor: laporan['nama_terlapor'],
          nilaiSuap: laporan['nilai_suap']);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
