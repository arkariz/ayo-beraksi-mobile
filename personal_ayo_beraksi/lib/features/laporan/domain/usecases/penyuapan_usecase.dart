import 'package:ayo_beraksi_flutter/core/params/add_laporan_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/repositories/laporan_repository.dart';

class PenyuapanUseCase implements UseCase<DataState<Laporan>, AddLaporanRequestParams> {
  final LaporanRepository _laporanRepository;

  PenyuapanUseCase(this._laporanRepository);

  @override
  Future<DataState<Laporan>> call({AddLaporanRequestParams? params}) {
    return _laporanRepository.addLaporanPenyuapan(params);
  }
}
