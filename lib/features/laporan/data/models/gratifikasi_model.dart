import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/gratifikasi.dart';

class GratifikasiModel extends Gratifikasi {
  const GratifikasiModel(
    String? noLaporan,
    String? pengirim,
    int idPelapor,
    String namaPelapor,
    String namaTerlapor,
    String jabatan,
    String instansi,
    String tanggalKejadian,
    String tanggalPelaporan,
    String kronologisKejadian,
    String? status,
    String? deskripsiStatus,
    String? tidakLanjut,
    int id,
    String message,
  ) : super(
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
          tidakLanjut,
          id,
          message,
        );

  factory GratifikasiModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> user = json['data'];
    return GratifikasiModel(
      user['no_laporan'],
      user['pengirim'],
      user['id_pelapor'],
      user['nama_pelapor'],
      user['nama_terlapor'],
      user['jabatan'],
      user['instansi'],
      user['tanggal_kejadian'],
      user["tanggal_pelaporan"],
      user['kronologis_kejadian'],
      user['status'],
      user['deskripsi_status'],
      user['tindaklanjut'],
      user['id'],
      json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
