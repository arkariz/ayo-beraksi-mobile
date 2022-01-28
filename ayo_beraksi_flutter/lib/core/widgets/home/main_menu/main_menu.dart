import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/core/params/notification_params.dart';
import 'package:ayo_beraksi_flutter/core/resources/notification_service.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/laporan_list/laporan_list_bloc.dart';
import '../../../../features/notification/domain/entities/notification.dart' as ne;
import 'package:ayo_beraksi_flutter/features/notification/presentation/bloc/fcm/fcm_bloc.dart';
import 'package:ayo_beraksi_flutter/features/notification/presentation/bloc/notification/notification_bloc.dart';
import 'package:ayo_beraksi_flutter/core/widgets/home/main_menu/widget/header.dart';
import 'package:ayo_beraksi_flutter/core/widgets/home/main_menu/widget/menu.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'widget/laporan_section.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    BlocProvider.of<LaporanListBloc>(context).add(GetLaporanList());
    BlocProvider.of<NotificationBloc>(context).add(GetAllNotificationEvent());

    tz.initializeTimeZones();
    final service = NotificationService();
    service.initNotification();

    _getFcmToken(context);
    _listenNotification(service.channel.id, service.channel.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: 5,
        top: 8,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          Header(size: size),
          const Menu(),
          LaporanSection(size: size),
        ],
      ),
    );
  }

  void _getFcmToken(BuildContext context) {
    final messaging = FirebaseMessaging.instance;

    messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    messaging.getToken().then((value) {
      BlocProvider.of<FcmBloc>(context).add(PostFcmToken({'token': value}));
    });
  }

  void _listenNotification(String channelId, String channelName) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        NotificationService().showNotification(
          notification.hashCode,
          notification.title!,
          notification.body!,
          2,
          channelId,
          channelName,
        );

        var remoteNotification = NotificationParams(
          notification: ne.Notification(
            notification.hashCode,
            notification.title!,
            notification.body!,
            DateTime.now(),
            false,
          ),
        );

        BlocProvider.of<NotificationBloc>(context).add(SaveNotificationEvent(remoteNotification));
      }
    });
  }
}
