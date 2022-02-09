import 'package:equatable/equatable.dart';

class Pengaduan extends Equatable {
  const Pengaduan(this.namaKetua, this.idPelapor, this.namaPelapor, this.alamat, this.uranianLaporan, this.status,
      this.deskripsiStatus, this.id, this.message, this.nik, this.saranMasukan, this.tanggalPengaduan);

  final String namaKetua;
  final int idPelapor;
  final String namaPelapor;
  final String alamat;
  final String nik;
  final String uranianLaporan;
  final String saranMasukan;
  final String tanggalPengaduan;
  final String? status;
  final String? deskripsiStatus;
  final int id;
  final String message;

  @override
  List<Object?> get props => [
        namaKetua,
        idPelapor,
        namaPelapor,
        alamat,
        nik,
        uranianLaporan,
        saranMasukan,
        tanggalPengaduan,
        status,
        deskripsiStatus,
        id,
        message
      ];

  @override
  bool get stringify => true;
}
