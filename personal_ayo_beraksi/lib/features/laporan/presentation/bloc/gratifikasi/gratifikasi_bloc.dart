import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/params/add_laporan_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/Gratifikasi.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/gratifikasi_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'gratifikasi_event.dart';
part 'gratifikasi_state.dart';

class GratifikasiBloc extends BlocWithState<GratifikasiEvent, GratifikasiState> {
  final GratifikasiUseCase _gratifikasiUseCase;

  GratifikasiBloc(this._gratifikasiUseCase) : super(GratifikasiInitial());

  @override
  Stream<GratifikasiState> mapEventToState(GratifikasiEvent event) async* {
    if (event is AddLaporanGratifikasi) {
      yield* _addGratifikasi(event.laporan);
    }
  }

  Stream<GratifikasiState> _addGratifikasi(Map<String, dynamic> params) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _gratifikasiUseCase(
        params: AddLaporanRequestParams(laporan: params),
      );

      if (dataState is DataSuccess && dataState.data!.namaPelapor.isNotEmpty) {
        final response = dataState.data;
        final _gratifikasi = Gratifikasi(
          response!.noLaporan,
          response.pengirim,
          response.idPelapor,
          response.namaPelapor,
          response.namaTerlapor,
          response.jabatan,
          response.instansi,
          response.tanggalKejadian,
          response.tanggalPelaporan,
          response.kronologisKejadian,
          response.status,
          response.deskripsiStatus,
          response.tindakLanjut,
          response.id,
          response.message,
        );
        yield GratifikasiSuccess(_gratifikasi);
      }
      if (dataState is DataFailed) {
        yield GratifikasiFailed(dataState.error);
      }
    });
  }
}
