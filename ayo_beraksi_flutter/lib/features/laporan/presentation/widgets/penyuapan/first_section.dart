import 'package:ayo_beraksi_flutter/core/widgets/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({
    Key? key,
    required this.size,
    required this.namaController,
    required this.jabatanController,
    required this.instansiController,
  }) : super(key: key);

  final Size size;
  final TextEditingController namaController;

  final TextEditingController jabatanController;

  final TextEditingController instansiController;

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  final FocusNode namaNode = FocusNode();

  final FocusNode jabatanNode = FocusNode();
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
                controller: widget.namaController,
                node: namaNode,
                size: widget.size,
                label: "Nama Terlapor",
                type: TextInputType.text),
          ),
          CustomTextField(
              controller: widget.jabatanController,
              node: jabatanNode,
              size: widget.size,
              label: "Jabatan",
              type: TextInputType.text),
          CustomTextField(
              controller: widget.instansiController,
              node: instansiNode,
              size: widget.size,
              label: "Instansi / Perusahaan",
              type: TextInputType.text)
        ],
      ),
    );
  }
}
