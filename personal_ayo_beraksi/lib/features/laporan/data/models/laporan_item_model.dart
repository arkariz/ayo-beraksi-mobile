import 'package:hive_flutter/hive_flutter.dart';

part 'laporan_item_model.g.dart';

@HiveType(typeId: 3)
class LaporanItemModel extends HiveObject {
  @HiveField(0)
  int? noLaporan;

  @HiveField(1)
  String? pengirim;

  @HiveField(2)
  String? namaTerlapor;

  @HiveField(3)
  String? jabatan;

  @HiveField(4)
  String? instansi;

  @HiveField(5)
  String? namaPelapor;

  @HiveField(6)
  String? tanggalKejadian;

  @HiveField(7)
  String? tanggalPelaporan;

  @HiveField(8)
  String? kronologisKejadian;

  @HiveField(9)
  String? status;

  @HiveField(10)
  String? deskripsiStatus;

  @HiveField(11)
  String? tindakLanjut;

  @HiveField(12)
  int id;

  @HiveField(13)
  String tipeLaporan;

  LaporanItemModel(
    this.noLaporan,
    this.pengirim,
    this.namaTerlapor,
    this.jabatan,
    this.instansi,
    this.namaPelapor,
    this.tanggalKejadian,
    this.tanggalPelaporan,
    this.kronologisKejadian,
    this.status,
    this.deskripsiStatus,
    this.tindakLanjut,
    this.id,
    this.tipeLaporan,
  );
}
