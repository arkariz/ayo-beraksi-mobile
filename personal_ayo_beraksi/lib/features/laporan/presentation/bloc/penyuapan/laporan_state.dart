part of 'laporan_bloc.dart';

abstract class LaporanState extends Equatable {
  final Laporan? laporan;
  final DioError? error;

  const LaporanState({this.laporan, this.error});

  @override
  List<Object?> get props => [laporan, error];
}

class LaporanPenyuapanInitial extends LaporanState {}

class LaporanPenyuapanSuccess extends LaporanState {
  const LaporanPenyuapanSuccess(Laporan? laporan) : super(laporan: laporan);
}

class LaporanPenyuapanFailed extends LaporanState {
  const LaporanPenyuapanFailed(DioError? error) : super(error: error);
}
