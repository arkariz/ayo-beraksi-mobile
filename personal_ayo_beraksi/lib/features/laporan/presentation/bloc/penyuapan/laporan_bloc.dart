import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/params/add_laporan_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/penyuapan_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'laporan_event.dart';
part 'laporan_state.dart';

class LaporanBloc extends BlocWithState<LaporanEvent, LaporanState> {
  final PenyuapanUseCase _penyuapanUseCase;

  LaporanBloc(this._penyuapanUseCase) : super(LaporanPenyuapanInitial());

  @override
  Stream<LaporanState> mapEventToState(LaporanEvent event) async* {
    if (event is AddLaporanPenyuapan) {
      yield* _addLaporanPenyuapan(event.laporan);
    }
  }

  Stream<LaporanState> _addLaporanPenyuapan(Map<String, dynamic> params) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _penyuapanUseCase(
        params: AddLaporanRequestParams(laporan: params),
      );

      if (dataState is DataSuccess && dataState.data!.namaTerlapor.isNotEmpty) {
        final response = dataState.data;
        final _laporan = Laporan(
            response!.namaTerlapor,
            response.jabatan,
            response.instansi,
            response.idPelapor,
            response.namaPelapor,
            response.jabatanPelapor,
            response.instansiPelapor,
            response.instansi,
            response.nilaiSuap,
            response.lokasi,
            response.tanggalKejadian,
            response.tanggalPelaporan,
            response.kronologisKejadian,
            response.status,
            response.deskripsiStatus,
            response.id,
            response.message);
        yield LaporanPenyuapanSuccess(_laporan);
      }
      if (dataState is DataFailed) {
        yield LaporanPenyuapanFailed(dataState.error);
      }
    });
  }
}
