import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan.dart';

class LaporanModel extends Laporan {
  const LaporanModel(
      String namaTerlapor,
      String jabatan,
      String instansi,
      int idPelapor,
      String namaPelapor,
      String? jabatanPelapor,
      String? instansiPelapor,
      String kasusSuap,
      String nilaiSuap,
      String lokasi,
      String tanggalKejadian,
      String tanggalPelaporan,
      String kronologisKejadian,
      String? status,
      String? deskripsiStatus,
      int id,
      String message)
      : super(
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
            message);

  factory LaporanModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> data = json['data'];
    return LaporanModel(
        data['nama_terlapor'],
        data['jabatan'],
        data['instansi'],
        data['id_pelapor'],
        data['nama_pelapor'],
        data['jabatan_pelapor'],
        data['instansi_pelapor'],
        data['kasus_suap'],
        data['nilai_suap'],
        data['lokasi'],
        data['tanggal_kejadian'],
        data['tanggal_pelaporan'],
        data['kronologis_kejadian'],
        data['status'],
        data['deskripsi_status'],
        data['id'],
        json['message']);
  }
}
