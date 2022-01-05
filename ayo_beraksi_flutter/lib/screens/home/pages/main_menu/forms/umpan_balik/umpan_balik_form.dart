import 'package:ayo_beraksi_flutter/common/agreement.dart';
import 'package:ayo_beraksi_flutter/common/custom_back_button.dart';
import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/forms/umpan_balik/components/first_section_umpan_balik.dart';
import 'package:flutter/material.dart';

class UmpanBalikForm extends StatefulWidget {
  const UmpanBalikForm({Key? key}) : super(key: key);

  @override
  State<UmpanBalikForm> createState() => _UmpanBalikFormState();
}

class _UmpanBalikFormState extends State<UmpanBalikForm> {
  final formFieldKey = GlobalKey<FormState>();
  bool _isChecked = false;

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
          scrollDirection: Axis.vertical,
          child: Form(
            key: formFieldKey,
            child: Column(
              children: [
                const CustomBackButton(title: 'Umpan Balik'),
                FirstSectionUmpanBalik(size: size),
                Agreement(
                  size: size,
                  onChanged: (value) => setState(() => _isChecked = value),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isChecked
                          ? () {
                              if (formFieldKey.currentState!.validate()) {
                                null;
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => OTPScreen(
                                //             phoneNumber: tlpController.text,
                                //           )),
                                // );
                              }
                            }
                          : null,
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
