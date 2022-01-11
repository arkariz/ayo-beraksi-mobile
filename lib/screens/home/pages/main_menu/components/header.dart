import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            "Ayo\nBerAksi",
            style: TextStyle(color: kTitleColor, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(right: kDefaultPadding),
                child: const Text(
                  "Hai, Rizky",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.jpg"),
                radius: 25,
              )
            ],
          )
        ],
      ),
    );
  }
}
