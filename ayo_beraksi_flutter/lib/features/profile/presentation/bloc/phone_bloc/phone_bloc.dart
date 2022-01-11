import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/params/profile_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/entities/change_tlp.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/usecases/change_telepon_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'phone_event.dart';
part 'phone_state.dart';

class PhoneBloc extends BlocWithState<PhoneEvent, PhoneState> {
  final ChangeTeleponUseCase _changeTeleponUseCase;

  PhoneBloc(this._changeTeleponUseCase) : super(ChangeTeleponInitial());

  @override
  Stream<PhoneState> mapEventToState(PhoneEvent event) async* {
    if (event is ChangeTeleponEvent) {
      yield* _changeTelepon(event.telepon);
    }
    if (event is ResetPhoneEvent) {
      yield ChangeTeleponInitial();
    }
  }

  Stream<PhoneState> _changeTelepon(Map<String, dynamic> params) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _changeTeleponUseCase(
        params: ChangeProfileParams(profile: params),
      );

      if (dataState is DataSuccess && dataState.data!.message.isNotEmpty) {
        final response = dataState.data;
        final teleponMessage = ChangeTelepon(response!.noTlp, response.message);
        yield ChangeTeleponSuccess(teleponMessage);
      }
      if (dataState is DataFailed) {
        yield ChangeTeleponFailed(dataState.error);
      }
    });
  }
}
