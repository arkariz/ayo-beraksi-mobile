import 'package:ayo_beraksi_flutter/common/custom_back_button.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class BantuanScreen extends StatelessWidget {
  const BantuanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: kDefaultPadding + 5,
          right: kDefaultPadding + 5,
          top: kDefaultPadding * 3,
        ),
        child: Column(
          children: [
            const CustomBackButton(title: 'Bantuan'),
            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding),
              child: Column(
                children: const [
                  FaqExpandable(
                    header: "Bagaimana Cara Melakukan Pengaduan?",
                    body:
                        "Kembali ke Beranda, kemudian masuk ke menu pengaduan. Silahkan isikan formulir sesuai kebutuhan anda, laporan anda akan diproses secepat mungkin oleh petugas",
                  ),
                  FaqExpandable(
                    header: "Berapa lama laporan kita akan diproses?",
                    body:
                        "Kembali ke Beranda, kemudian masuk ke menu pengaduan. Silahkan isikan formulir sesuai kebutuhan anda, laporan anda akan diproses secepat mungkin oleh petugas",
                  ),
                  FaqExpandable(
                    header: "Bagaimana merubah data diri kita?",
                    body:
                        "Kembali ke Beranda, kemudian masuk ke menu pengaduan. Silahkan isikan formulir sesuai kebutuhan anda, laporan anda akan diproses secepat mungkin oleh petugas",
                  ),
                  FaqExpandable(
                    header: "Apa itu HSKU?",
                    body:
                        "Kembali ke Beranda, kemudian masuk ke menu pengaduan. Silahkan isikan formulir sesuai kebutuhan anda, laporan anda akan diproses secepat mungkin oleh petugas",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FaqExpandable extends StatelessWidget {
  const FaqExpandable({
    Key? key,
    required this.header,
    required this.body,
  }) : super(key: key);

  final String header;
  final String body;

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Text(
        header,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      collapsed: const Text(""),
      expanded: Padding(
        padding: const EdgeInsets.only(bottom: kDefaultPadding),
        child: Text(
          body,
          softWrap: true,
          style: const TextStyle(color: Colors.black45),
        ),
      ),
    );
  }
}
