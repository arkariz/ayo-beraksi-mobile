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
        backgroundColor: kPrimaryColor,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: size.width, child: Image.asset("assets/images/logo.png", scale: 2)),
                SizedBox(
                  width: size.width,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: "Ayo Belawan",
                            style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: "\nBersih Anti Korupsi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
