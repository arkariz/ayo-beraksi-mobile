import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/laporanlist_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'laporan_list_event.dart';
part 'laporan_list_state.dart';

class LaporanListBloc extends BlocWithState<LaporanListEvent, LaporanListState> {
  final LaporanListUsecase _laporanListUsecase;

  LaporanListBloc(this._laporanListUsecase) : super(LaporanListInitial());

  @override
  Stream<LaporanListState> mapEventToState(LaporanListEvent event) async* {
    if (event is GetLaporanList) {
      yield* _getLaporanList();
    }
  }

  Stream<LaporanListState> _getLaporanList() async* {
    yield* runBlocProcess(() async* {
      final dataState = await _laporanListUsecase();

      if (dataState is DataSuccess && dataState.data != null) {
        final response = dataState.data;
        yield LaporanListSuccess(response);
      }
      if (dataState is DataFailed) {
        yield LaporanListFailed(dataState.error);
      }
    });
  }
}
