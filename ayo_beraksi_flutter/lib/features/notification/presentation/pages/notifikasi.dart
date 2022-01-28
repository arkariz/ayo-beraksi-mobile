import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/notification/presentation/widgets/notifikasi_body.dart';
import 'package:flutter/material.dart';

class Notifikasi extends StatelessWidget {
  const Notifikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(
          top: kDefaultPadding * 2,
        ),
        child: NotifikasiBody(size: size));
  }
}
