import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class TextDescription extends StatelessWidget {
  const TextDescription({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding),
      child: SizedBox(
        width: size.width * 0.70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Verifikasi OTP",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Pastikan Nomor Telepon yang Anda masukkan sudah sesuai",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
