import 'package:ayo_beraksi_flutter/common/statefull_wraper.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/core/resources/notification_service.dart';
import 'package:ayo_beraksi_flutter/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/components/header.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/components/menu.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timezone/data/latest.dart' as tz;

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
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
      BlocProvider.of<NotificationBloc>(context).add(PostFcmToken({'token': value}));
    });
  }

  void _listenNotification(String channelId, String channelName) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("test ${message.notification!.title}");
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
      }
    });
  }

  @override
  void initState() {
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
        top: kDefaultPadding * 2,
      ),
      child: Column(
        children: <Widget>[
          Header(size: size),
          const Menu(),
        ],
      ),
    );
  }
}
