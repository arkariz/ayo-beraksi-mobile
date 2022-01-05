import 'package:ayo_beraksi_flutter/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class SecondSection extends StatelessWidget {
  SecondSection({
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
            padding: const EdgeInsets.only(top: kDefaultPadding * 1.5),
            child: CustomTextField(
              controller: kasusController,
              node: kasusNode,
              size: size,
              label: "Kasus Penyuapan",
              type: TextInputType.text,
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down,
                color: kPrimaryColor,
              ),
            ),
          ),
          CustomTextField(
            controller: nilaiController,
            node: nilaiNode,
            size: size,
            label: "Nilai suap yang diberikan",
            type: TextInputType.text,
            suffixIcon: const Icon(
              Icons.monetization_on_outlined,
              color: kPrimaryColor,
            ),
          ),
          CustomTextField(
            controller: lokasiController,
            node: lokasiNode,
            size: size,
            label: "Lokasi Kejadian",
            type: TextInputType.text,
            suffixIcon: const Icon(
              Icons.pin_drop_outlined,
              color: kPrimaryColor,
            ),
          ),
          CustomTextField(
            controller: tanggalController,
            node: tanggalNode,
            size: size,
            label: "Tanggal Kejadian",
            type: TextInputType.text,
            suffixIcon: const Icon(
              Icons.calendar_today,
              color: kPrimaryColor,
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
