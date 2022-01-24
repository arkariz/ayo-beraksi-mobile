import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/laporanlist_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'laporan_list_event.dart';
part 'laporan_list_state.dart';

class LaporanListBloc extends BlocWithState<LaporanListEvent, LaporanListState> {
  final LaporanListUsecase _laporanListUsecase;

  LaporanListBloc(this._laporanListUsecase) : super(LaporanListInitial());

  List<LaporanItem> _allLaporan = [];

  List<LaporanItem> _foundLaporan = [];

  @override
  Stream<LaporanListState> mapEventToState(LaporanListEvent event) async* {
    if (event is GetLaporanList) {
      yield* _getLaporanList();
    }
    if (event is FilterLaporanList) {
      yield* _filterLaporanList(event.enteredWord);
    }
  }

  Stream<LaporanListState> _getLaporanList() async* {
    yield* runBlocProcess(() async* {
      final dataState = await _laporanListUsecase();

      if (dataState is DataSuccess && dataState.data != null) {
        final response = dataState.data;
        _allLaporan = _formatDate(response?.laporanList ?? []);
        yield LaporanListSuccess(_allLaporan);
      }
      if (dataState is DataFailed) {
        yield LaporanListFailed(dataState.error);
      }
    });
  }

  Stream<LaporanListState> _filterLaporanList(String enteredKeyword) async* {
    yield* runBlocProcess(() async* {
      _runFilter(enteredKeyword);
      yield LaporanListFiltered(_foundLaporan, _allLaporan);
    });
  }

  void _runFilter(String enteredKeyword) {
    List<LaporanItem> results = [];

    if (enteredKeyword == "Semua") {
      results = _allLaporan;
    } else {
      results = _allLaporan.where((laporan) {
        if (laporan.status != null) {
          return laporan.status!.toLowerCase().contains(enteredKeyword.toLowerCase());
        } else {
          return false;
        }
      }).toList();
    }

    _foundLaporan = results;
  }

  List<LaporanItem> _formatDate(List<LaporanItem> laporan) {
    List<LaporanItem> result = [];
    if (laporan.isNotEmpty) {
      for (var i in laporan) {
        final date = DateFormat("yyyy-MM-dd").parse(i.tanggalPelaporan ?? i.tanggalPengaduan!);
        final formatedDate = DateFormat.yMMMMd().format(date);

        final formatedLaporan = LaporanItem(
          i.noLaporan,
          i.pengirim,
          i.namaTerlapor,
          i.jabatan,
          i.instansi,
          i.namaPelapor,
          i.tanggalKejadian,
          formatedDate,
          formatedDate,
          i.kronologisKejadian,
          i.status,
          i.deskripsiStatus,
          i.tindakLanjut,
          i.id,
          i.tipeLaporan,
        );
        result.add(formatedLaporan);
      }
    }
    return result;
  }
}
