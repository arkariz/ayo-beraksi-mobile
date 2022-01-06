import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/params/login_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/entities/user.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/usecases/get_user_usecases.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends BlocWithState<LoginEvent, LoginState> {
  final GetUserUseCase _getUserUseCase;

  LoginBloc(this._getUserUseCase) : super(const LoginLoading());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is GetUser) {
      yield* _getUser(event.auth);
    }
    if (event is DestroyToken) {
      yield* _destroyToken();
    }
  }

  Stream<LoginState> _getUser(Map<String, dynamic> auth) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _getUserUseCase(
        params: LoginRequestParams(auth: auth),
      );

      if (dataState is DataSuccess && dataState.data!.name.isNotEmpty) {
        final user = dataState.data;
        final _user = User(user!.name, user.id, user.email, user.noTlp, user.nip, user.roleId, user.token);

        yield LoginDone(_user);
      }
      if (dataState is DataFailed) {
        yield LoginError(dataState.error);
      }
    });
  }

  Stream<LoginState> _destroyToken() async* {
    yield* runBlocProcess(() async* {
      const _user = User("", 0, "", "", "", 0, "");
      yield const LoggedOut(_user);
    });
  }
}
