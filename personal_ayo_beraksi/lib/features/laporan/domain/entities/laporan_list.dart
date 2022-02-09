import 'package:equatable/equatable.dart';

class LaporanList extends Equatable {
  const LaporanList(this.laporanList);

  final List<LaporanItem> laporanList;

  @override
  List<Object?> get props => [laporanList];

  @override
  bool get stringify => true;
}

class LaporanItem extends Equatable {
  const LaporanItem(
      this.noLaporan,
      this.pengirim,
      this.namaTerlapor,
      this.jabatan,
      this.instansi,
      this.namaPelapor,
      this.tanggalKejadian,
      this.tanggalPelaporan,
      this.tanggalPengaduan,
      this.kronologisKejadian,
      this.status,
      this.deskripsiStatus,
      this.tindakLanjut,
      this.id,
      this.tipeLaporan);

  final int? noLaporan;
  final String? pengirim;
  final String? namaTerlapor;
  final String? jabatan;
  final String? instansi;
  final String? namaPelapor;
  final String? tanggalKejadian;
  final String? tanggalPelaporan;
  final String? tanggalPengaduan;
  final String? kronologisKejadian;
  final String? status;
  final String? deskripsiStatus;
  final String? tindakLanjut;
  final int id;
  final String tipeLaporan;

  @override
  List<Object?> get props => [
        noLaporan,
        pengirim,
        namaTerlapor,
        jabatan,
        instansi,
        namaPelapor,
        tanggalKejadian,
        tanggalPelaporan,
        tanggalPengaduan,
        kronologisKejadian,
        status,
        deskripsiStatus,
        tindakLanjut,
        id,
        tipeLaporan
      ];

  @override
  bool get stringify => true;
}
