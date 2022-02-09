import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/params/add_laporan_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/pengaduan.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/pengaduan_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'pengaduan_event.dart';
part 'pengaduan_state.dart';

class PengaduanBloc extends BlocWithState<PengaduanEvent, PengaduanState> {
  final PengaduanUseCase _pengaduanUseCase;

  PengaduanBloc(this._pengaduanUseCase) : super(PengaduanInitial());

  @override
  Stream<PengaduanState> mapEventToState(PengaduanEvent event) async* {
    if (event is AddLaporanPengaduan) {
      yield* _addPengaduan(event.laporan);
    }
  }

  Stream<PengaduanState> _addPengaduan(Map<String, dynamic> params) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _pengaduanUseCase(
        params: AddLaporanRequestParams(laporan: params),
      );

      if (dataState is DataSuccess && dataState.data!.namaPelapor.isNotEmpty) {
        final response = dataState.data;
        final _pengaduan = Pengaduan(
          response!.namaKetua,
          response.idPelapor,
          response.namaPelapor,
          response.alamat,
          response.uranianLaporan,
          response.status,
          response.deskripsiStatus,
          response.id,
          response.message,
          response.nik,
          response.saranMasukan,
          response.tanggalPengaduan,
        );
        yield PengaduanSuccess(_pengaduan);
      }
      if (dataState is DataFailed) {
        yield PengaduanFailed(dataState.error);
      }
    });
  }
}
