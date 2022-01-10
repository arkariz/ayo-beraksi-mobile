import 'package:ayo_beraksi_flutter/core/params/login_request.dart';
import 'package:ayo_beraksi_flutter/core/params/profile_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/entities/change_name_message.dart';

abstract class ProfileRepository {
  Future<DataState<ChangeNameMessage>> changeName(ChangeNameParams? params);
}
