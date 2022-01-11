import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/main_menu.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/notifikasi/notifikasi.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/pencarian/pencarian.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/profil/profil.dart';
import 'package:flutter/material.dart';

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
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Beranda"),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Pencarian"),
              BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined), label: "Notifikasi"),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profil"),
            ]),
      ),
    );
  }
}
