import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';

class LaporanListModel extends LaporanList {
  const LaporanListModel(List<LaporanItem> laporanList) : super(laporanList);

  factory LaporanListModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];

    final List<LaporanItem> laporanList = [];

    for (var i in data) {
      var laporan = LaporanItem(
        i["no_laporan"],
        i["pengirim"],
        i["nama_terlapor"],
        i["jabatan"],
        i["instansi"],
        i["nama_pelapor"],
        i["tanggal_kejadian"],
        i["tanggal_pelaporan"],
        i["kronologis_kejadian"],
        i["status"],
        i["deskripsi_status"],
        i["tindakLanjut"],
        i["id"],
        i["tipe_laporan"],
      );
      laporanList.add(laporan);
    }
    return LaporanListModel(laporanList);
  }
}

// class LaporanListItem extends LaporanList {
//   const LaporanListItem(
//       int? noLaporan,
//       String? pengirim,
//       String namaTerlapor,
//       String jabatan,
//       String instansi,
//       int idPelapor,
//       String namaPelapor,
//       String tanggalKejadian,
//       String tanggalPelaporan,
//       String kronologisKejadian,
//       String? status,
//       String? deskripsiStatus,
//       String? tindakLanjut,
//       int id,
//       String tipeLaporan)
//       : super(
//           noLaporan,
//           pengirim,
//           namaTerlapor,
//           jabatan,
//           instansi,
//           idPelapor,
//           namaPelapor,
//           tanggalKejadian,
//           tanggalPelaporan,
//           kronologisKejadian,
//           status,
//           deskripsiStatus,
//           tindakLanjut,
//           id,
//           tipeLaporan,
//         );

//   factory LaporanListItem.fromJson(Map<String, dynamic> json) {
//     List<dynamic> data = json['data'];
//     return LaporanListItem(
//         data['no_laporan'],
//         data['pengirim'],
//         data['nama_terlapor'],
//         data['jabatan'],
//         data['instansi'],
//         data['id_pelapor'],
//         data['nama_pelapor'],
//         data['tanggal_kejadian'],
//         data['tanggal_pelaporan'],
//         data['kronologis_kejadian'],
//         data['status'],
//         data['deskripsi_status'],
//         data['tindaklanjut'],
//         data['id'],
//         json['tipe_laporan']);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'no_laporan': noLaporan,
//       'pengirim': pengirim,
//       'nama_terlapor': namaTerlapor,
//       'jabatan': jabatan,
//       'instansi': instansi,
//       'id_pelapor': idPelapor,
//       'nama_pelapor': namaPelapor,
//       'tanggal_kejadian': tanggalKejadian,
//       'tanggal_pelaporan': tanggalPelaporan,
//       'kronologis_kejadian': kronologisKejadian,
//       'status': status,
//       'deskripsi_status': deskripsiStatus,
//       'tindaklanjut': tindakLanjut,
//       'id': id,
//       'tipe_laporan': tipeLaporan,
//     };
//   }
// }
