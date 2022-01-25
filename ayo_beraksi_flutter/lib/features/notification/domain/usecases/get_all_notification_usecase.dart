import 'package:ayo_beraksi_flutter/core/params/no_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/core/usecases/usecases.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/notification.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/repositories/notification_repository.dart';

class GetAllNotificationUseCase implements UseCase<DataState<List<Notification>?>, NoParams> {
  final NotificationRepository _notificationRepository;

  GetAllNotificationUseCase(this._notificationRepository);

  @override
  Future<DataState<List<Notification>?>> call({NoParams? params}) {
    return _notificationRepository.getAllNotification(params);
  }
}
