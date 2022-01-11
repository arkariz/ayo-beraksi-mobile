import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/pengaduan.dart';

class PengaduanModel extends Pengaduan {
  const PengaduanModel(
      String namaKetua,
      int idPelapor,
      String namaPelapor,
      String alamat,
      String uraianLaporan,
      String? status,
      String? deskripsiStatus,
      int id,
      String message,
      String nik,
      String saranMasukan,
      String tanggalPengaduan)
      : super(namaKetua, idPelapor, namaPelapor, alamat, uraianLaporan, status, deskripsiStatus, id, message, nik,
            saranMasukan, tanggalPengaduan);

  factory PengaduanModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> user = json['data'];
    return PengaduanModel(
      user['nama_ketua'],
      user['id_pelapor'],
      user['nama_pelapor'],
      user['alamat'],
      user['uraian_laporan'],
      user['status'],
      user['deskripsi_status'],
      user['id'],
      json['message'],
      user['nik'],
      user["saran_masukan"],
      user["tanggal_pengaduan"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
