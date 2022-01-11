import 'package:ayo_beraksi_flutter/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class FirstSectionGratifikasi extends StatelessWidget {
  FirstSectionGratifikasi({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

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
                size: size,
                label: "Nama Terlapor",
                type: TextInputType.text),
          ),
          CustomTextField(
            controller: alamatController,
            node: alamatNode,
            size: size,
            label: "Alamat",
            type: TextInputType.text,
            maxLines: 8,
          ),
        ],
      ),
    );
  }
}
