import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.name, this.id, this.email, this.noTlp, this.nip, this.roleId, this.token);

  final int id;
  final String name;
  final String email;
  final String noTlp;
  final String? nip;
  final int roleId;
  final String token;

  @override
  List<Object?> get props => [id, name, email, noTlp, nip, roleId, token];

  @override
  bool get stringify => true;
}
