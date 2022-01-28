import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/notification.dart' as ne;
import 'package:ayo_beraksi_flutter/features/notification/presentation/bloc/notification/notification_bloc.dart';
import 'package:ayo_beraksi_flutter/core/widgets/home/main_menu/main_menu.dart';
import 'package:ayo_beraksi_flutter/features/notification/presentation/pages/notifikasi.dart';
import 'package:ayo_beraksi_flutter/core/widgets/search/pencarian.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/pages/profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final pages = [const MainMenu(), const Pencarian(), const Notifikasi(), const Profil()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: IndexedStack(
          alignment: AlignmentDirectional.center,
          index: currentIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Beranda"),
              const BottomNavigationBarItem(icon: Icon(Icons.search), label: "Pencarian"),
              BottomNavigationBarItem(
                icon: BlocBuilder<NotificationBloc, NotificationState>(
                  builder: (context, state) {
                    List<ne.Notification> notification = [];

                    if (state is GetNotificationSuccess) {
                      notification = state.notifications!;
                    }
                    if (state is UpdateNotificationSuccess) {
                      notification = state.notifications!;
                    }

                    final isNotRead = notification.where((element) => element.isRead == false);
                    if (isNotRead.isNotEmpty) {
                      return const Icon(
                        Icons.notifications_active,
                        color: kPrimaryColor,
                      );
                    } else {
                      return const Icon(Icons.notifications_none);
                    }
                  },
                ),
                label: "Notifikasi",
              ),
              const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profil"),
            ]),
      ),
    );
  }
}
