import 'package:ayo_beraksi_flutter/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class FirstSectionGratifikasi extends StatefulWidget {
  FirstSectionGratifikasi({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<FirstSectionGratifikasi> createState() => _FirstSectionGratifikasiState();
}

class _FirstSectionGratifikasiState extends State<FirstSectionGratifikasi> {
  final namaController = TextEditingController();

  final FocusNode namaNode = FocusNode();

  final alamatController = TextEditingController();

  final FocusNode alamatNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Identitas Terlapor",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding * 0.5),
            child: CustomTextField(
                controller: namaController,
                node: namaNode,
                size: widget.size,
                label: "Nama Terlapor",
                type: TextInputType.text),
          ),
          CustomTextField(
            controller: alamatController,
            node: alamatNode,
            size: widget.size,
            label: "Alamat",
            type: TextInputType.text,
            maxLines: 8,
          ),
        ],
      ),
    );
  }
}
