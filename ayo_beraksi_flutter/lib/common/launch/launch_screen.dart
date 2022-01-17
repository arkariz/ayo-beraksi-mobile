import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/pages/pengaduan_form.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/pages/login.dart';
import 'package:ayo_beraksi_flutter/features/register/presentation/pages/register.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

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
              top: kDefaultPadding * 3,
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
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                        height: 45,
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
                      SizedBox(
                        width: size.width * 0.4,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                          child: const Text("Masuk"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: kPrimaryColor,
                            side: const BorderSide(color: kPrimaryColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: kDefaultPadding * 1.5,
                    bottom: kDefaultPadding * 1.5,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 1,
                          child: Container(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      const Text(
                        "Masuk sebagai Tamu",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 1,
                          child: Container(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PengaduanForm(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.person_outlined),
                        ),
                        Text("Pengaduan"),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black54,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
