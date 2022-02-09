import 'package:ayo_beraksi_flutter/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class FirstSectionPengaduan extends StatefulWidget {
  const FirstSectionPengaduan({
    Key? key,
    required this.size,
    required this.kepadaController,
    required this.nikController,
    required this.namaController,
    required this.alamatController,
  }) : super(key: key);

  final Size size;
  final TextEditingController kepadaController;
  final TextEditingController nikController;
  final TextEditingController namaController;
  final TextEditingController alamatController;

  @override
  State<FirstSectionPengaduan> createState() => _FirstSectionPengaduanState();
}

class _FirstSectionPengaduanState extends State<FirstSectionPengaduan> {
  final FocusNode kepadaNode = FocusNode();
  final FocusNode nikNode = FocusNode();
  final FocusNode namaNode = FocusNode();
  final FocusNode alamatNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tertuju Kepada",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding * 0.5),
            child: CustomTextField(
                controller: widget.kepadaController,
                node: kepadaNode,
                size: widget.size,
                label: "Nama",
                type: TextInputType.text),
          ),
          const Padding(
            padding: EdgeInsets.only(top: kDefaultPadding),
            child: Text(
              "Yang bertandatangan di bawah ini",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding * 0.5),
            child: CustomTextField(
                controller: widget.nikController,
                node: nikNode,
                size: widget.size,
                label: "Nomor Induk Kependudukan",
                type: TextInputType.number),
          ),
          CustomTextField(
              controller: widget.namaController,
              node: namaNode,
              size: widget.size,
              label: "Nama",
              type: TextInputType.text),
          CustomTextField(
            controller: widget.alamatController,
            node: alamatNode,
            size: widget.size,
            label: "Alamat",
            type: TextInputType.text,
            maxLines: 6,
          ),
        ],
      ),
    );
  }
}
