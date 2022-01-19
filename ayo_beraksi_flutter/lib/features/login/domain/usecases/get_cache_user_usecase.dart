import 'package:ayo_beraksi_flutter/core/params/no_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/entities/user.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/repositories/login_repository.dart';

class GetCacheUserUceCase implements UseCase<DataState<User>, NoParams> {
  final LoginRepository _loginRepository;

  GetCacheUserUceCase(this._loginRepository);

  @override
  Future<DataState<User>> call({NoParams? params}) {
    return _loginRepository.getUserCache();
  }
}
