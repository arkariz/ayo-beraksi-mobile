import 'package:ayo_beraksi_flutter/core/params/add_laporan_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/pengaduan.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/repositories/laporan_repository.dart';

class PengaduanUseCase implements UseCase<DataState<Pengaduan>, AddLaporanRequestParams> {
  final LaporanRepository _laporanRepository;

  PengaduanUseCase(this._laporanRepository);

  @override
  Future<DataState<Pengaduan>> call({AddLaporanRequestParams? params}) {
    return _laporanRepository.addLaporanPengaduan(params);
  }
}
