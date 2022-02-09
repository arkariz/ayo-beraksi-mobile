import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/params/no_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/laporanlist_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends BlocWithState<SearchEvent, SearchState> {
  final LaporanListUsecase _laporanListUsecase;

  SearchBloc(this._laporanListUsecase) : super(const SearchInit());

  List<LaporanItem> _allLaporan = [];

  List<LaporanItem> _foundLaporan = [];

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is InitSearchEvent) {
      yield* _initSearch();
    }
    if (event is TypingSearchEvent) {
      yield const Searching();
    }
    if (event is DoSearchEvent) {
      yield* _searching(event.enteredWord);
    }
  }

  Stream<SearchState> _initSearch() async* {
    yield* runBlocProcess(() async* {
      final dataState = await _laporanListUsecase(
        params: const NoParams(),
      );

      if (dataState is DataSuccess) {
        final response = dataState.data;
        // _formatDate(response!.laporanList);
        _allLaporan = _formatDate(response!.laporanList);
        yield SearchInit(laporanList: response);
      }
    });
  }

  Stream<SearchState> _searching(String enteredKeyword) async* {
    yield* runBlocProcess(() async* {
      _runFilter(enteredKeyword);

      if (_foundLaporan.isNotEmpty) {
        yield SearchFound(LaporanList(_foundLaporan));
      }
      if (_foundLaporan.isEmpty) {
        yield const SearchNotFoundState();
      }
    });
  }

  void _runFilter(String enteredKeyword) {
    List<LaporanItem> results = [];

    if (enteredKeyword.isEmpty) {
      results = _allLaporan;
    } else {
      results = _allLaporan
          .where((laporan) => laporan.tipeLaporan.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    _foundLaporan = results;
  }

  List<LaporanItem> _formatDate(List<LaporanItem> laporan) {
    List<LaporanItem> result = [];
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
    return result;
  }
}
