import 'package:ayo_beraksi_flutter/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class FirstSection extends StatefulWidget {
  FirstSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
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
            padding: const EdgeInsets.only(top: kDefaultPadding * 0.5),
            child: CustomTextField(
                controller: namaController,
                node: namaNode,
                size: widget.size,
                label: "Nama Terlapor",
                type: TextInputType.text),
          ),
          CustomTextField(
              controller: jabatanController,
              node: jabatanNode,
              size: widget.size,
              label: "Jabatan",
              type: TextInputType.text),
          CustomTextField(
              controller: instansiController,
              node: instansiNode,
              size: widget.size,
              label: "Instansi / Perusahaan",
              type: TextInputType.text)
        ],
      ),
    );
  }
}
