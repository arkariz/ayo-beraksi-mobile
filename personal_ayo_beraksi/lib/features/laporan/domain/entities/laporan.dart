import 'package:equatable/equatable.dart';

class Laporan extends Equatable {
  const Laporan(
      this.namaTerlapor,
      this.jabatan,
      this.instansi,
      this.idPelapor,
      this.namaPelapor,
      this.jabatanPelapor,
      this.instansiPelapor,
      this.kasusSuap,
      this.nilaiSuap,
      this.lokasi,
      this.tanggalKejadian,
      this.tanggalPelaporan,
      this.kronologisKejadian,
      this.status,
      this.deskripsiStatus,
      this.id,
      this.message);

  final String namaTerlapor;
  final String jabatan;
  final String instansi;
  final int idPelapor;
  final String namaPelapor;
  final String? jabatanPelapor;
  final String? instansiPelapor;
  final String kasusSuap;
  final String nilaiSuap;
  final String lokasi;
  final String tanggalKejadian;
  final String tanggalPelaporan;
  final String kronologisKejadian;
  final String? status;
  final String? deskripsiStatus;
  final int id;
  final String message;

  @override
  List<Object?> get props => [
        namaTerlapor,
        jabatan,
        instansi,
        idPelapor,
        namaPelapor,
        jabatanPelapor,
        instansiPelapor,
        kasusSuap,
        nilaiSuap,
        lokasi,
        tanggalKejadian,
        tanggalPelaporan,
        kronologisKejadian,
        status,
        deskripsiStatus,
        id,
        message
      ];

  @override
  bool get stringify => true;
}
