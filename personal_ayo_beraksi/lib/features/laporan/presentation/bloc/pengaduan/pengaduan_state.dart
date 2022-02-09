part of 'pengaduan_bloc.dart';

abstract class PengaduanState extends Equatable {
  final Pengaduan? pengaduan;
  final DioError? error;

  const PengaduanState({this.pengaduan, this.error});

  @override
  List<Object?> get props => [Pengaduan, error];
}

class PengaduanInitial extends PengaduanState {}

class PengaduanSuccess extends PengaduanState {
  const PengaduanSuccess(Pengaduan? pengaduan) : super(pengaduan: pengaduan);
}

class PengaduanFailed extends PengaduanState {
  const PengaduanFailed(DioError? error) : super(error: error);
}
