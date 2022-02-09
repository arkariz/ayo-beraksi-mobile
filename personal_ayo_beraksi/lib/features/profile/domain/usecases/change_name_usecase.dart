import 'package:ayo_beraksi_flutter/core/params/profile_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/entities/change_name_message.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/repositories/profile_repository.dart';

class ChangeNameUseCase implements UseCase<DataState<ChangeNameMessage?>, ChangeProfileParams> {
  final ProfileRepository _profileRepository;

  ChangeNameUseCase(this._profileRepository);

  @override
  Future<DataState<ChangeNameMessage?>> call({ChangeProfileParams? params}) {
    return _profileRepository.changeName(params);
  }
}
