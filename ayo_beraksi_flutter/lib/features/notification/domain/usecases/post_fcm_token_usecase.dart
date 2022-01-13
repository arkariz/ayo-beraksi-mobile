import 'package:ayo_beraksi_flutter/core/params/login_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/fcm.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/repositories/notification_repository.dart';

class PostFcmTokenUseCase implements UseCase<DataState<Fcm?>, LoginRequestParams> {
  final NotificationRepository _notificationRepository;

  PostFcmTokenUseCase(this._notificationRepository);

  @override
  Future<DataState<Fcm?>> call({LoginRequestParams? params}) {
    return _notificationRepository.postFcmToken(params);
  }
}
