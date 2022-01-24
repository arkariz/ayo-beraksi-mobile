import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/feedback.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/entities/user.dart';

class FeedbackModel extends Feedback {
  const FeedbackModel(
    int? id,
    String? namaPengguna,
    String? bintangKepuasan,
    String? responKepuasan,
    String? alasan,
    int? idPengguna,
    String? message,
  ) : super(namaPengguna, id, bintangKepuasan, responKepuasan, alasan, idPengguna, message);

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> laporan = json['data'];
    return FeedbackModel(laporan['id'], laporan['nama_pengguna'], laporan['bintang_kepuasan'],
        laporan['respon_kepuasan'], laporan['alasan'], laporan['id_pengguna'], json["message"]);
  }
}
