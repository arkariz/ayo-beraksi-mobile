import 'package:ayo_beraksi_flutter/core/params/login_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/entities/user.dart';

abstract class LoginRepository {
  Future<DataState<User>> getUser(LoginRequestParams? params);
  Future<DataState<User>> getUserCache();
  Future<DataState<String?>> deleteUser();
}
