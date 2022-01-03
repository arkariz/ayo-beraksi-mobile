import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/profil/components/avatar.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/profil/components/biodata.dart';
import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

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
          SizedBox(
            width: size.width,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.exit_to_app_outlined),
              label: Text("Keluar"),
            ),
          )
        ],
      ),
    );
  }
}
