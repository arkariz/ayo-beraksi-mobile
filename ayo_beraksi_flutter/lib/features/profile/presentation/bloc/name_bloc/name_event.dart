part of 'name_bloc.dart';

abstract class NameEvent extends Equatable {
  const NameEvent();

  @override
  List<Object> get props => [];
}

class ChangeName extends NameEvent {
  final Map<String, dynamic> name;

  const ChangeName(this.name);
}

class ResetNameEvent extends NameEvent {}
