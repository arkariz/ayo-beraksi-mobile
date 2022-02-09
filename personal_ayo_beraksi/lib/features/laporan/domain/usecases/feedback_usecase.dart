import 'package:ayo_beraksi_flutter/core/params/add_laporan_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/feedback.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/repositories/laporan_repository.dart';

class FeedbackUseCase implements UseCase<DataState<Feedback>, AddLaporanRequestParams> {
  final LaporanRepository _laporanRepository;

  FeedbackUseCase(this._laporanRepository);

  @override
  Future<DataState<Feedback>> call({AddLaporanRequestParams? params}) {
    return _laporanRepository.addLaporanFeedback(params);
  }
}
