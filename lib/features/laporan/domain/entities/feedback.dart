import 'package:equatable/equatable.dart';

class Feedback extends Equatable {
  const Feedback(this.namaPengguna, this.id, this.bintangKepuasan, this.responKepuasan, this.alasan, this.idPengguna,
      this.message);

  final int? id;
  final String? namaPengguna;
  final String? bintangKepuasan;
  final String? responKepuasan;
  final String? alasan;
  final int? idPengguna;
  final String? message;

  @override
  List<Object?> get props => [id, namaPengguna, bintangKepuasan, responKepuasan, alasan, idPengguna, message];

  @override
  bool get stringify => true;
}
