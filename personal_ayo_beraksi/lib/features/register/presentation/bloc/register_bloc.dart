import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/params/register_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/register/domain/usecases/post_register_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:retrofit/retrofit.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends BlocWithState<RegisterEvent, RegisterState> {
  final PostRegisterUseCase _postRegisterUseCase;

  RegisterBloc(this._postRegisterUseCase) : super(const RegisterInit());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterUser) {
      yield* _registerUser(event.auth);
    }
  }

  Stream<RegisterState> _registerUser(Map<String, dynamic> auth) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _postRegisterUseCase(
        params: RegisterRequestParams(auth: auth),
      );

      if (dataState is DataSuccess) {
        final response = dataState.data;
        yield RegisterSuccess(response);
      }
      if (dataState is DataFailed) {
        yield RegisterFailed(dataState.error);
      }
    });
  }
}
