part of 'phone_bloc.dart';

abstract class PhoneEvent extends Equatable {
  const PhoneEvent();

  @override
  List<Object> get props => [];
}

class ChangeTeleponEvent extends PhoneEvent {
  final Map<String, dynamic> telepon;

  const ChangeTeleponEvent(this.telepon);
}

class ResetPhoneEvent extends PhoneEvent {}
