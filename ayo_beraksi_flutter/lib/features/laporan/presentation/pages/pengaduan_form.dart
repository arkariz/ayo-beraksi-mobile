import 'package:ayo_beraksi_flutter/common/agreement.dart';
import 'package:ayo_beraksi_flutter/common/custom_back_button.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/widgets/pengaduan/first_section_pengaduan.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/widgets/pengaduan/second_section_pengaduan.dart';
import 'package:flutter/material.dart';

class PengaduanForm extends StatefulWidget {
  const PengaduanForm({Key? key}) : super(key: key);

  @override
  State<PengaduanForm> createState() => _PengaduanFormState();
}

class _PengaduanFormState extends State<PengaduanForm> {
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
          child: Form(
            key: formFieldKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(title: 'Laporan Pengaduan'),
                FirstSectionPengaduan(size: size),
                SecondSectionPengaduan(size: size),
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
