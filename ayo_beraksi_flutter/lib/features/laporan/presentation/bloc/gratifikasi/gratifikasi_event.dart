part of 'gratifikasi_bloc.dart';

abstract class GratifikasiEvent extends Equatable {
  const GratifikasiEvent();

  @override
  List<Object> get props => [];
}

class AddLaporanGratifikasi extends GratifikasiEvent {
  final Map<String, dynamic> laporan;

  const AddLaporanGratifikasi(this.laporan);
}
