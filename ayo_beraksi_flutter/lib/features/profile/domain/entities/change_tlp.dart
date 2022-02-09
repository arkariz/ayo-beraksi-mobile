import 'package:equatable/equatable.dart';

class ChangeTelepon extends Equatable {
  const ChangeTelepon(
    this.noTlp,
    this.message,
  );

  final String message;
  final String noTlp;

  @override
  List<Object> get props => [noTlp, message];

  @override
  bool get stringify => true;
}
