import 'package:ayo_beraksi_flutter/core/params/notification_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/notification.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/repositories/notification_repository.dart';

class UpdateNotificationUsecase implements UseCase<DataState<List<Notification>>, UpdateNotificationParams> {
  final NotificationRepository _notificationRepository;

  UpdateNotificationUsecase(this._notificationRepository);

  @override
  Future<DataState<List<Notification>>> call({UpdateNotificationParams? params}) {
    return _notificationRepository.updateNotification(params);
  }
}
