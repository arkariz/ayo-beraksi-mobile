import 'package:ayo_beraksi_flutter/core/params/login_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/entities/user.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/repositories/login_repository.dart';

class GetUserUseCase implements UseCase<DataState<User>, LoginRequestParams> {
  final LoginRepository _loginRepository;

  GetUserUseCase(this._loginRepository);

  @override
  Future<DataState<User>> call({LoginRequestParams? params}) {
    return _loginRepository.getUser(params);
  }
}
