import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/params/add_laporan_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/feedback.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/feedback_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends BlocWithState<FeedbackEvent, FeedbackState> {
  final FeedbackUseCase _feedbackUseCase;

  FeedbackBloc(this._feedbackUseCase) : super(FeedbackInitial());

  @override
  Stream<FeedbackState> mapEventToState(FeedbackEvent event) async* {
    if (event is AddFeedback) {
      yield* _addFeedback(event.laporan);
    }
  }

  Stream<FeedbackState> _addFeedback(Map<String, dynamic> params) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _feedbackUseCase(
        params: AddLaporanRequestParams(laporan: params),
      );

      if (dataState is DataSuccess && dataState.data?.bintangKepuasan != null) {
        final response = dataState.data;
        final _feedback = Feedback(
          response!.namaPengguna,
          response.id,
          response.bintangKepuasan,
          response.responKepuasan,
          response.alasan,
          response.idPengguna,
          response.message,
        );
        yield FeedbackSuccess(_feedback);
      }
      if (dataState is DataFailed) {
        yield FeedbackFailed(dataState.error);
      }
    });
  }
}
