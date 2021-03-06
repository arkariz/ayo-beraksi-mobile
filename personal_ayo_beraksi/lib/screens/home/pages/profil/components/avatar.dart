import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.jpg"),
          radius: 61,
        ),
        const SizedBox(
          height: 5.0,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Ganti foto profil",
            style: TextStyle(color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}
