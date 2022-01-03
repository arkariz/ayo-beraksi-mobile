import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class NotifikasiEmpty extends StatelessWidget {
  const NotifikasiEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Image.asset(
            "assets/images/notification.png",
            scale: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(top: kDefaultPadding * 2),
            child: Text(
              "Tidak ada notifikasi masuk",
              style: TextStyle(color: Colors.black54, fontSize: 24),
            ),
          )
        ]));
  }
}
