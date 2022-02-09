part of 'laporan_bloc.dart';

abstract class LaporanEvent extends Equatable {
  const LaporanEvent();

  @override
  List<Object> get props => [];
}

class AddLaporanPenyuapan extends LaporanEvent {
  final Map<String, dynamic> laporan;

  const AddLaporanPenyuapan(this.laporan);
}
