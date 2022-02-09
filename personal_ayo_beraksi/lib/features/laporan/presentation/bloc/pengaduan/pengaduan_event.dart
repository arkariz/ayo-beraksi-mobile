part of 'pengaduan_bloc.dart';

abstract class PengaduanEvent extends Equatable {
  const PengaduanEvent();

  @override
  List<Object> get props => [];
}

class AddLaporanPengaduan extends PengaduanEvent {
  final Map<String, dynamic> laporan;

  const AddLaporanPengaduan(this.laporan);
}
