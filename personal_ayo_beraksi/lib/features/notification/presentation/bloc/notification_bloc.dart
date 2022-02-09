import 'package:ayo_beraksi_flutter/core/bloc/bloc_with_state.dart';
import 'package:ayo_beraksi_flutter/core/params/login_request.dart';
import 'package:ayo_beraksi_flutter/core/resources/data_state.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/fcm.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/usecases/post_fcm_token_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends BlocWithState<NotificationEvent, NotificationState> {
  final PostFcmTokenUseCase _postFcmTokenUseCase;

  NotificationBloc(this._postFcmTokenUseCase) : super(PostFcmTokenInitial());

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is PostFcmToken) {
      yield* _postFcmToken(event.token);
    }
    if (event is ResetNotificationEvent) {
      yield PostFcmTokenInitial();
    }
  }

  Stream<NotificationState> _postFcmToken(Map<String, dynamic> params) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _postFcmTokenUseCase(
        params: LoginRequestParams(auth: params),
      );

      if (dataState is DataSuccess && dataState.data!.message.isNotEmpty) {
        final response = dataState.data;
        final fcmTokenMessage = Fcm(response!.message);
        yield PostFcmTokenSuccess(fcmTokenMessage);
      }
      if (dataState is DataFailed) {
        yield PostFcmTokenFailed(dataState.error);
      }
    });
  }
}
