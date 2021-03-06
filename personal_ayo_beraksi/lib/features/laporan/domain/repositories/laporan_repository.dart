import 'package:ayo_beraksi_flutter/core/params/add_laporan_request.dart';
import 'package:ayo_beraksi_flutter/core/params/no_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/feedback.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/gratifikasi.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/pengaduan.dart';

abstract class LaporanRepository {
  Future<DataState<Laporan>> addLaporanPenyuapan(AddLaporanRequestParams? params);
  Future<DataState<Pengaduan>> addLaporanPengaduan(AddLaporanRequestParams? params);
  Future<DataState<Gratifikasi>> addLaporanGratifikasi(AddLaporanRequestParams? params);
  Future<DataState<Feedback>> addLaporanFeedback(AddLaporanRequestParams? params);
  Future<DataState<LaporanList>> getLaporanList(NoParams? params);
}
