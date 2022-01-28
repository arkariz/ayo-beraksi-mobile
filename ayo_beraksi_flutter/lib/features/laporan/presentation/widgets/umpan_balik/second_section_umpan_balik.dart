import 'package:ayo_beraksi_flutter/core/widgets/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class SecondSectionUmpanBalik extends StatefulWidget {
  const SecondSectionUmpanBalik({Key? key, required this.size, required this.alasanController}) : super(key: key);

  final Size size;
  final TextEditingController alasanController;

  @override
  State<SecondSectionUmpanBalik> createState() => _SecondSectionUmpanBalikState();
}

class _SecondSectionUmpanBalikState extends State<SecondSectionUmpanBalik> {
  final FocusNode kronologiNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Boleh kami tahu alasannya?",
            style: TextStyle(fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: CustomTextField(
              controller: widget.alasanController,
              node: kronologiNode,
              size: widget.size,
              label: "Berikan Masukkan Anda",
              type: TextInputType.text,
              maxLines: 6,
            ),
          )
        ],
      ),
    );
  }
}
