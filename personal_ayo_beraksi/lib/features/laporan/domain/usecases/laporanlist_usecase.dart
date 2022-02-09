import 'package:ayo_beraksi_flutter/core/params/no_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/repositories/laporan_repository.dart';

class LaporanListUsecase implements UseCase<DataState<LaporanList>, NoParams> {
  final LaporanRepository _laporanRepository;

  LaporanListUsecase(this._laporanRepository);

  @override
  Future<DataState<LaporanList>> call({NoParams? params}) {
    return _laporanRepository.getLaporanList(params);
  }
}
