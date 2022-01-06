import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class HeaderwithSearch extends StatelessWidget {
  const HeaderwithSearch({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Row(
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
                      "Hai, Radias",
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
          Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding * 2),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                      hintText: "Cari",
                      hintStyle: TextStyle(color: Colors.black12),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search_outlined,
                        color: kPrimaryColor,
                      )),
                ),
              ))
        ],
      ),
    );
  }
}
