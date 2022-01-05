import 'package:ayo_beraksi_flutter/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class SecondSectionPengaduan extends StatelessWidget {
  SecondSectionPengaduan({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  final kasusController = TextEditingController();
  final FocusNode kasusNode = FocusNode();

  final nilaiController = TextEditingController();
  final FocusNode nilaiNode = FocusNode();

  final lokasiController = TextEditingController();
  final FocusNode lokasiNode = FocusNode();

  final tanggalController = TextEditingController();
  final FocusNode tanggalNode = FocusNode();

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
            "Kronologis Kejadian",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding * 0.5),
            child: CustomTextField(
              controller: kasusController,
              node: kasusNode,
              size: size,
              label: "Tanggal Kejadian",
              type: TextInputType.text,
              suffixIcon: const Icon(
                Icons.calendar_today_rounded,
                color: kPrimaryColor,
              ),
            ),
          ),
          CustomTextField(
            controller: kronologiController,
            node: kronologiNode,
            size: size,
            label: "Kronologis Kejadian",
            type: TextInputType.text,
            maxLines: 8,
          ),
        ],
      ),
    );
  }
}
