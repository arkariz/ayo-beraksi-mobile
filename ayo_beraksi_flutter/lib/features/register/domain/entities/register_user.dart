import 'package:equatable/equatable.dart';

class RegisterUser extends Equatable {
  const RegisterUser(this.name, this.email, this.noTlp, this.nip, this.roleId, this.password);

  final String name;
  final String email;
  final String password;
  final String noTlp;
  final String nip;
  final int roleId;

  @override
  List<Object> get props => [name, email, password, noTlp, nip, roleId];

  @override
  bool get stringify => true;
}
