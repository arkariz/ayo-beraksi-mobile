import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/params/profile_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/entities/change_name_message.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/usecases/change_name_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends BlocWithState<ProfileEvent, ProfileState> {
  final ChangeNameUseCase _ChangeNameUseCase;

  ProfileBloc(this._ChangeNameUseCase) : super(ChangeNameInitial());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ChangeName) {
      yield* _ChangeName(event.name);
    }
  }

  Stream<ProfileState> _ChangeName(Map<String, dynamic> params) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _ChangeNameUseCase(
        params: ChangeNameParams(profile: params),
      );

      if (dataState is DataSuccess && dataState.data!.message.isNotEmpty) {
        final response = dataState.data;
        final nameMessage = ChangeNameMessage(response!.message);
        yield ChangeNameSuccess(nameMessage);
      }
      if (dataState is DataFailed) {
        yield ChangeNameFailed(dataState.error);
      }
    });
  }
}
