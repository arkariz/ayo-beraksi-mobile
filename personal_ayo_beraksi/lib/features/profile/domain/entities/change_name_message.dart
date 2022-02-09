import 'package:equatable/equatable.dart';

class ChangeNameMessage extends Equatable {
  const ChangeNameMessage(
    this.name,
    this.message,
  );

  final String message;
  final String name;

  @override
  List<Object> get props => [name, message];

  @override
  bool get stringify => true;
}
