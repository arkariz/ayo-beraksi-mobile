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

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  void _getFcmToken(BuildContext context) {
    final messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      BlocProvider.of<NotificationBloc>(context).add(PostFcmToken({'token': value}));
    });
  }

  void _listenNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      NotificationService().showNotification(
        event.notification.hashCode,
        event.notification!.title!,
        event.notification!.body!,
        2,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StatefulWrapper(
      onInit: () {
        tz.initializeTimeZones();
        NotificationService().initNotification();

        _getFcmToken(context);
        _listenNotification();
      },
      child: Padding(
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
      ),
    );
  }
}
