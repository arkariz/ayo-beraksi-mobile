import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.name, this.id, this.email, this.noTlp, this.nip, this.roleId);

  final int id;
  final String name;
  final String email;
  final String noTlp;
  final String nip;
  final int roleId;

  @override
  List<Object> get props => [id, name, email, noTlp, nip, roleId];

  @override
  bool get stringify => true;
}
