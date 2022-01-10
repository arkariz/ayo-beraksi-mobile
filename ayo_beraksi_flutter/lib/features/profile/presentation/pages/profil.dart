import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/widgets/alert_dialog.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/widgets/avatar.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/widgets/biodata.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/widgets/profile_consumer.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        top: kDefaultPadding * 2,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            const Avatar(),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            Biodata(),
            const SizedBox(
              height: kDefaultPadding * 3,
            ),
            ProfileConsumer(size: size),
            SizedBox(
              width: size.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlrtDialog();
                      });
                },
                icon: const Icon(Icons.exit_to_app_outlined),
                label: const Text("Keluar"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
