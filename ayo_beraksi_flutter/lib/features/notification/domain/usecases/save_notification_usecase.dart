import 'package:ayo_beraksi_flutter/core/params/notification_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/repositories/notification_repository.dart';

class SaveNotificationUseCase implements UseCase<DataState<String?>, NotificationParams> {
  final NotificationRepository _notificationRepository;

  SaveNotificationUseCase(this._notificationRepository);

  @override
  Future<DataState<String?>> call({NotificationParams? params}) {
    return _notificationRepository.saveNotification(params);
  }
}
