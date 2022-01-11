import 'package:ayo_beraksi_flutter/core/params/profile_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/entities/change_tlp.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/repositories/profile_repository.dart';

class ChangeTeleponUseCase implements UseCase<DataState<ChangeTelepon?>, ChangeProfileParams> {
  final ProfileRepository _profileRepository;

  ChangeTeleponUseCase(this._profileRepository);

  @override
  Future<DataState<ChangeTelepon?>> call({ChangeProfileParams? params}) {
    return _profileRepository.changeTelepon(params);
  }
}
