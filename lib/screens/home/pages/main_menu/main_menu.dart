import 'package:ayo_beraksi_flutter/common/statefull_wraper.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/core/resources/notification_service.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/laporan_list/laporan_list_bloc.dart';
import 'package:ayo_beraksi_flutter/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/components/header.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/components/laporan_listview.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/components/listview_header.dart';
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
    BlocProvider.of<LaporanListBloc>(context).add(GetLaporanList());

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
          SizedBox(
            height: size.height * 0.75,
            child: const Menu(),
          ),
          SizedBox(
            height: size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListViewHeader(),
                BlocBuilder<LaporanListBloc, LaporanListState>(
                  builder: (context, state) {
                    if (state.laporanList != null) {
                      if (state.laporanList!.isNotEmpty) {
                        return LaporanListView(foundLaporan: state.laporanList);
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(top: kDefaultPadding * 3),
                          child: Image.asset("assets/images/complete.png"),
                        );
                      }
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
