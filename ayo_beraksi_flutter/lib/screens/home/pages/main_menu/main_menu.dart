import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/components/header.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/components/menu.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

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
