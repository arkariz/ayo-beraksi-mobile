import 'package:equatable/equatable.dart';

class Fcm extends Equatable {
  const Fcm(
    this.message,
  );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}
