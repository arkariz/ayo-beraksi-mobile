part of 'phone_bloc.dart';

abstract class PhoneState extends Equatable {
  final ChangeTelepon? telepon;
  final DioError? error;

  const PhoneState({this.telepon, this.error});

  @override
  List<Object?> get props => [telepon, error];
}

//Change Telepon
class ChangeTeleponInitial extends PhoneState {}

class ChangeTeleponSuccess extends PhoneState {
  const ChangeTeleponSuccess(ChangeTelepon? telepon) : super(telepon: telepon);
}

class ChangeTeleponFailed extends PhoneState {
  const ChangeTeleponFailed(DioError? error) : super(error: error);
}
