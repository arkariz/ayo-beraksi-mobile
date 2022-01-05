import 'package:ayo_beraksi_flutter/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class FirstSection extends StatelessWidget {
  FirstSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  final namaController = TextEditingController();
  final FocusNode namaNode = FocusNode();

  final jabatanController = TextEditingController();
  final FocusNode jabatanNode = FocusNode();

  final instansiController = TextEditingController();
  final FocusNode instansiNode = FocusNode();

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
            padding: const EdgeInsets.only(top: kDefaultPadding * 1.5),
            child: CustomTextField(
                controller: namaController,
                node: namaNode,
                size: size,
                label: "Nama Terlapor",
                type: TextInputType.text),
          ),
          CustomTextField(
              controller: jabatanController, node: jabatanNode, size: size, label: "Jabatan", type: TextInputType.text),
          CustomTextField(
              controller: instansiController,
              node: instansiNode,
              size: size,
              label: "Instansi / Perusahaan",
              type: TextInputType.text)
        ],
      ),
    );
  }
}
