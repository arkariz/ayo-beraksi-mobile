import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  const Notification(
    this.id,
    this.title,
    this.body,
  );

  final int id;
  final String title;
  final String body;

  @override
  List<Object> get props => [id, title, body];

  @override
  bool get stringify => true;
}
