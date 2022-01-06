import 'package:ayo_beraksi_flutter/core/params/register_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/register/domain/repositories/register_repository.dart';
import 'package:retrofit/dio.dart';

class PostRegisterUseCase implements UseCase<DataState<HttpResponse>, RegisterRequestParams> {
  final RegisterRepository _registerRepository;

  PostRegisterUseCase(this._registerRepository);

  @override
  Future<DataState<HttpResponse>> call({RegisterRequestParams? params}) {
    return _registerRepository.postRegister(params);
  }
}
