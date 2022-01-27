import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/params/notification_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/notification.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/usecases/get_all_notification_usecase.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/usecases/save_notification_usecase.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/usecases/update_notification_usecase.dart';
import 'package:equatable/equatable.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends BlocWithState<NotificationEvent, NotificationState> {
  final SaveNotificationUseCase _saveNotificationUseCase;
  final GetAllNotificationUseCase _getAllNotificationUseCase;
  final UpdateNotificationUsecase _updateNotificationUsecase;

  NotificationBloc(
    this._saveNotificationUseCase,
    this._getAllNotificationUseCase,
    this._updateNotificationUsecase,
  ) : super(GetNotificationInitial());

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is SaveNotificationEvent) {
      yield* _saveNotification(event.notification);
    }
    if (event is GetAllNotificationEvent) {
      yield* _getNotification();
    }
    if (event is NotificationInitial) {
      yield GetNotificationInitial();
    }
    if (event is UpdateNotificationEvent) {
      yield* _updateNotification(event.notification);
    }
  }

  Stream<NotificationState> _saveNotification(NotificationParams params) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _saveNotificationUseCase(
        params: params,
      );

      if (dataState is DataSuccess && dataState.data != null) {
        final response = dataState.data;
        yield SaveNotificationSuccess(response);
      }
      if (dataState is DataFailed) {
        final response = dataState.data;
        yield SaveNotificationFailed(response);
      }
    });
  }

  Stream<NotificationState> _getNotification() async* {
    yield* runBlocProcess(() async* {
      final dataState = await _getAllNotificationUseCase();

      if (dataState is DataSuccess && dataState.data != null) {
        final response = dataState.data;
        yield GetNotificationSuccess(response);
      }
      if (dataState is DataFailed) {
        yield const GetNotificationFailed("gagal");
      }
    });
  }

  Stream<NotificationState> _updateNotification(UpdateNotificationParams params) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _updateNotificationUsecase(params: params);

      if (dataState is DataSuccess && dataState.data != null) {
        final response = dataState.data;
        yield UpdateNotificationSuccess(response);
      }
      if (dataState is DataFailed) {
        yield const UpdateNotificationFailed("gagal");
      }
    });
  }
}
