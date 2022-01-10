import 'package:ayo_beraksi_flutter/core/params/add_laporan_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/repositories/penyuapan_repository.dart';

class PenyuapanUseCase implements UseCase<DataState<Laporan>, AddLaporanRequestParams> {
  final PenyuapanRepository _penyuapanRepository;

  PenyuapanUseCase(this._penyuapanRepository);

  @override
  Future<DataState<Laporan>> call({AddLaporanRequestParams? params}) {
    return _penyuapanRepository.addLaporanPenyuapan(params);
  }
}
