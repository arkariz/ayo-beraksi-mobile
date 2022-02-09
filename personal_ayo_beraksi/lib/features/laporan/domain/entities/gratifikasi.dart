import 'package:equatable/equatable.dart';

class Gratifikasi extends Equatable {
  const Gratifikasi(
    this.noLaporan,
    this.pengirim,
    this.idPelapor,
    this.namaPelapor,
    this.namaTerlapor,
    this.jabatan,
    this.instansi,
    this.tanggalKejadian,
    this.tanggalPelaporan,
    this.kronologisKejadian,
    this.status,
    this.deskripsiStatus,
    this.tindakLanjut,
    this.id,
    this.message,
  );

  final String? noLaporan;
  final String? pengirim;
  final int idPelapor;
  final String namaPelapor;
  final String namaTerlapor;
  final String jabatan;
  final String instansi;
  final String tanggalKejadian;
  final String tanggalPelaporan;
  final String kronologisKejadian;
  final String? status;
  final String? deskripsiStatus;
  final String? tindakLanjut;
  final int id;
  final String message;

  @override
  List<Object?> get props => [
        noLaporan,
        pengirim,
        idPelapor,
        namaPelapor,
        namaTerlapor,
        jabatan,
        instansi,
        tanggalKejadian,
        tanggalPelaporan,
        kronologisKejadian,
        status,
        deskripsiStatus,
        tindakLanjut,
        id,
        message
      ];

  @override
  bool get stringify => true;
}
