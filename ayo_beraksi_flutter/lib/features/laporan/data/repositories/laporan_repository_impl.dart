import 'dart:io';

import 'package:ayo_beraksi_flutter/core/params/no_params.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/datasources/remote/laporan_api_service.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/feedback.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/gratifikasi.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/params/add_laporan_request.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/pengaduan.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/repositories/laporan_repository.dart';
import 'package:ayo_beraksi_flutter/features/login/data/datasources/local/user_local_data_source.dart';
import 'package:dio/dio.dart';

class LaporanRepositoryImpl implements LaporanRepository {
  final LaporanApiService _laporanApiService;
  final UserLocalDataSource _userLocalDataSource;

  LaporanRepositoryImpl(this._userLocalDataSource, this._laporanApiService);

  @override
  Future<DataState<Laporan>> addLaporanPenyuapan(AddLaporanRequestParams? params) async {
    try {
      final token = await _userLocalDataSource.getUserCache();
      final laporan = params!.laporan;
      final httpResponse = await _laporanApiService.addLaporanPenyuapan(
          token: "Bearer ${token!.token}",
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

  @override
  Future<DataState<Pengaduan>> addLaporanPengaduan(AddLaporanRequestParams? params) async {
    try {
      final token = await _userLocalDataSource.getUserCache();
      final httpResponse = await _laporanApiService.addLaporanPengaduan(
          "Bearer ${token!.token}", "application/json", "application/json", params!.laporan);

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

  @override
  Future<DataState<Gratifikasi>> addLaporanGratifikasi(AddLaporanRequestParams? params) async {
    try {
      final token = await _userLocalDataSource.getUserCache();
      final httpResponse = await _laporanApiService.addLaporanGratifikasi(
          "Bearer ${token!.token}", "application/json", "application/json", params!.laporan);

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

  @override
  Future<DataState<Feedback>> addLaporanFeedback(AddLaporanRequestParams? params) async {
    try {
      final httpResponse =
          await _laporanApiService.addFeedback("application/json", "application/json", params!.laporan);

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

  @override
  Future<DataState<LaporanList>> getLaporanList(NoParams? params) async {
    try {
      final token = await _userLocalDataSource.getUserCache();
      final httpResponse = await _laporanApiService.getLaporanList(
        "Bearer ${token!.token}",
        "application/json",
        "application/json",
      );

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
