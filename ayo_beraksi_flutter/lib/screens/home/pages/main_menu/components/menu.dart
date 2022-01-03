import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: kDefaultPadding,
        crossAxisSpacing: kDefaultPadding,
        children: const <Widget>[
          MenuCard(
            primaryColor: kRedPrimaryColor,
            secondaryColor: kRedSecondaryColor,
            title: "Penyuapan",
            icon: "assets/icons/bribe.png",
          ),
          MenuCard(
            primaryColor: kPurplePrimaryColor,
            secondaryColor: kPurpleSecondaryColor,
            title: "Pengaduan",
            icon: "assets/icons/web-chat.png",
          ),
          MenuCard(
              primaryColor: kYellowPrimary,
              secondaryColor: kYellowSecondary,
              title: "Gratifikasi",
              icon: "assets/icons/money.png"),
          MenuCard(
              primaryColor: kGreenPrimary,
              secondaryColor: kGreenSecondary,
              title: "Umpan Balik",
              icon: "assets/icons/umpan-balik.png"),
          MenuCard(
              primaryColor: kBluePrimary,
              secondaryColor: kBlueSecondary,
              title: "Manajemen",
              icon: "assets/icons/manajemen.png"),
          MenuCard(
              primaryColor: kOrangePrimary,
              secondaryColor: kOrangeSecondary,
              title: "Bantuan",
              icon: "assets/icons/bantuan.png")
        ],
      ),
    );
  }
}

class MenuCard extends StatefulWidget {
  const MenuCard(
      {Key? key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.title,
      required this.icon})
      : super(key: key);

  final Color primaryColor;
  final Color secondaryColor;
  final String title;
  final String icon;

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTapDown: (details) => setState(() => isChanged = !isChanged),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: widget.secondaryColor,
            ),
            child: Stack(
              fit: StackFit.passthrough,
              clipBehavior: Clip.antiAlias,
              children: [
                Positioned(
                  left: 40,
                  top: -55,
                  child: Container(
                    height: 175,
                    width: 175,
                    decoration: BoxDecoration(
                        color: widget.primaryColor,
                        borderRadius: BorderRadius.circular(90)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(widget.icon, width: 80, height: 80),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
