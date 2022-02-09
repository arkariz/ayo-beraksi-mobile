import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  const Notification(
    this.id,
    this.title,
    this.body,
    this.dateTime,
    this.isRead,
  );

  final int id;
  final String title;
  final String body;
  final DateTime dateTime;
  final bool isRead;

  @override
  List<Object> get props => [id, title, body, dateTime];

  @override
  bool get stringify => true;
}
