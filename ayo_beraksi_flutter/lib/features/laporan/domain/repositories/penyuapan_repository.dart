import 'package:ayo_beraksi_flutter/core/params/add_laporan_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan.dart';

abstract class PenyuapanRepository {
  Future<DataState<Laporan>> addLaporanPenyuapan(AddLaporanRequestParams? params);
}
