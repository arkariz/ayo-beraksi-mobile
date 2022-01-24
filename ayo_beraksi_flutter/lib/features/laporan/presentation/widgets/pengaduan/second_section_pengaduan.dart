import 'package:ayo_beraksi_flutter/core/widgets/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class SecondSectionPengaduan extends StatefulWidget {
  const SecondSectionPengaduan({
    Key? key,
    required this.size,
    required this.laporanController,
    required this.saranController,
  }) : super(key: key);

  final Size size;

  final TextEditingController laporanController;
  final TextEditingController saranController;

  @override
  State<SecondSectionPengaduan> createState() => _SecondSectionPengaduanState();
}

class _SecondSectionPengaduanState extends State<SecondSectionPengaduan> {
  final FocusNode laporanNode = FocusNode();

  final FocusNode saranNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Laporan",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding * 0.5),
            child: CustomTextField(
              controller: widget.laporanController,
              node: laporanNode,
              size: widget.size,
              label: "Uraian Laporan",
              type: TextInputType.text,
              maxLines: 6,
            ),
          ),
          const Text(
            "Saran dan Masukkan",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding * 0.5),
            child: CustomTextField(
              controller: widget.saranController,
              node: saranNode,
              size: widget.size,
              label: "Saran dan Masukkan",
              type: TextInputType.text,
              maxLines: 8,
            ),
          ),
        ],
      ),
    );
  }
}
