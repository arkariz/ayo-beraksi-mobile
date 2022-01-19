import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: kDefaultPadding + 5,
              right: kDefaultPadding + 5,
              top: kDefaultPadding * 5,
            ),
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: size.width, child: Image.asset("assets/images/logo.png", scale: 2)),
                SizedBox(
                  width: size.width,
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: "Ayo", style: TextStyle(color: kPrimaryColor, fontSize: 27, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "\nBerAksi",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: "\nAyo Belawan bersih anti korupsi",
                        style:
                            TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 17, height: 1.8)),
                    TextSpan(
                        text: "\nSegala bentuk pengaduan anda akan kami proses secepat mungkin",
                        style: TextStyle(color: Colors.black54, fontSize: 15))
                  ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
