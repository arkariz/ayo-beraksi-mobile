import 'package:ayo_beraksi_flutter/core/params/no_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/repositories/notification_repository.dart';

class DeleteNotificationUsecase implements UseCase<DataState<String?>, NoParams> {
  final NotificationRepository _notificationRepository;

  DeleteNotificationUsecase(this._notificationRepository);

  @override
  Future<DataState<String?>> call({NoParams? params}) {
    return _notificationRepository.deleteNotification(params);
  }
}
