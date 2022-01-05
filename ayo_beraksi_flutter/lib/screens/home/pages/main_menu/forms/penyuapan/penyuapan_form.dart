import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/forms/penyuapan/components/agreement.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/forms/penyuapan/components/back_button.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/forms/penyuapan/components/first_section.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/forms/penyuapan/components/second_section.dart';
import 'package:flutter/material.dart';

class PenyuapanForm extends StatelessWidget {
  PenyuapanForm({Key? key}) : super(key: key);

  final formFieldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: kDefaultPadding + 5,
          right: kDefaultPadding + 5,
          top: kDefaultPadding * 3,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formFieldKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(),
                FirstSection(
                  size: size,
                ),
                SecondSection(size: size),
                Agreement(
                  size: size,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Kirim"),
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
