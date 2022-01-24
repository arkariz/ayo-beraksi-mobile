import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/params/profile_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/entities/change_name_message.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/usecases/change_name_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'name_event.dart';
part 'name_state.dart';

class NameBloc extends BlocWithState<NameEvent, NameState> {
  final ChangeNameUseCase _changeNameUseCase;

  NameBloc(this._changeNameUseCase) : super(ChangeNameInitial());

  @override
  Stream<NameState> mapEventToState(NameEvent event) async* {
    if (event is ChangeName) {
      yield* _changeName(event.name);
    }
    if (event is ResetNameEvent) {
      yield ChangeNameInitial();
    }
  }

  Stream<NameState> _changeName(Map<String, dynamic> params) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _changeNameUseCase(
        params: ChangeProfileParams(profile: params),
      );

      if (dataState is DataSuccess && dataState.data!.message.isNotEmpty) {
        final response = dataState.data;
        final nameMessage = ChangeNameMessage(response!.name, response.message);
        yield ChangeNameSuccess(nameMessage);
      }
      if (dataState is DataFailed) {
        yield ChangeNameFailed(dataState.error);
      }
    });
  }
}
