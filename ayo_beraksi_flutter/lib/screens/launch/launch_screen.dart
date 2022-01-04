import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:ayo_beraksi_flutter/screens/login/login.dart';
import 'package:ayo_beraksi_flutter/screens/register/register.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: kDefaultPadding + 5,
            right: kDefaultPadding + 5,
            top: kDefaultPadding * 2,
          ),
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
                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 17, height: 1.8)),
                  TextSpan(
                      text: "\nSegala bentuk pengaduan anda akan kami proses secepat mungkin",
                      style: TextStyle(color: Colors.black54, fontSize: 15))
                ])),
              ),
              Padding(
                padding: const EdgeInsets.only(top: kDefaultPadding * 2),
                child: SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Register()),
                      );
                    },
                    child: const Text("Daftar"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: kDefaultPadding * 0.2),
                child: SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: const Text("Masuk"),
                    style: ElevatedButton.styleFrom(primary: Colors.white, onPrimary: kPrimaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
