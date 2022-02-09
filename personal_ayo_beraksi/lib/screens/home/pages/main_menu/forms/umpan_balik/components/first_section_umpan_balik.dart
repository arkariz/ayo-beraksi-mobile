import 'package:ayo_beraksi_flutter/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class FirstSectionUmpanBalik extends StatelessWidget {
  FirstSectionUmpanBalik({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  final kronologiController = TextEditingController();
  final FocusNode kronologiNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Silahkan masukkan saran, kritik, atau pengaduan saudara atas layanan sertifikasi karantina pertanian di karantina Belawan secara lengkap beserta kronologinya",
            style: TextStyle(fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding * 0.5),
            child: CustomTextField(
              controller: kronologiController,
              node: kronologiNode,
              size: size,
              label: "Kronologis Kejadian",
              type: TextInputType.text,
              maxLines: 18,
            ),
          ),
        ],
      ),
    );
  }
}
