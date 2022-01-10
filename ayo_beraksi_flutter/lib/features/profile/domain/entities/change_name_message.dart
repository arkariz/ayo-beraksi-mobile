import 'package:equatable/equatable.dart';

class ChangeNameMessage extends Equatable {
  const ChangeNameMessage(
    this.message,
  );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}
