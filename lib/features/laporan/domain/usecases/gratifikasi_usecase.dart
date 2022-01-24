import 'package:ayo_beraksi_flutter/core/params/add_laporan_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/gratifikasi.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/repositories/laporan_repository.dart';

class GratifikasiUseCase implements UseCase<DataState<Gratifikasi>, AddLaporanRequestParams> {
  final LaporanRepository _laporanRepository;

  GratifikasiUseCase(this._laporanRepository);

  @override
  Future<DataState<Gratifikasi>> call({AddLaporanRequestParams? params}) {
    return _laporanRepository.addLaporanGratifikasi(params);
  }
}
