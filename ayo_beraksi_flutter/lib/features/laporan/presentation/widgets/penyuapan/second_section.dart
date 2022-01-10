import 'package:ayo_beraksi_flutter/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class SecondSection extends StatefulWidget {
  const SecondSection({
    Key? key,
    required this.size,
    required this.kasusController,
    required this.nilaiController,
    required this.lokasiController,
    required this.tanggalController,
    required this.kronologiController,
  }) : super(key: key);

  final Size size;
  final TextEditingController kasusController;
  final TextEditingController nilaiController;
  final TextEditingController lokasiController;
  final TextEditingController tanggalController;
  final TextEditingController kronologiController;

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  final FocusNode kasusNode = FocusNode();

  final FocusNode nilaiNode = FocusNode();

  final FocusNode lokasiNode = FocusNode();

  final FocusNode tanggalNode = FocusNode();

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
              controller: widget.kasusController,
              node: kasusNode,
              size: widget.size,
              label: "Kasus Penyuapan",
              type: TextInputType.text,
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down,
                color: kPrimaryColor,
              ),
            ),
          ),
          CustomTextField(
            controller: widget.nilaiController,
            node: nilaiNode,
            size: widget.size,
            label: "Nilai suap yang diberikan",
            type: TextInputType.text,
            suffixIcon: const Icon(
              Icons.monetization_on_outlined,
              color: kPrimaryColor,
            ),
          ),
          CustomTextField(
            controller: widget.lokasiController,
            node: lokasiNode,
            size: widget.size,
            label: "Lokasi Kejadian",
            type: TextInputType.text,
            suffixIcon: const Icon(
              Icons.pin_drop_outlined,
              color: kPrimaryColor,
            ),
          ),
          CustomTextField(
            controller: widget.tanggalController,
            node: tanggalNode,
            size: widget.size,
            label: "Tanggal Kejadian",
            type: TextInputType.datetime,
            suffixIcon: const Icon(
              Icons.calendar_today,
              color: kPrimaryColor,
            ),
          ),
          CustomTextField(
            controller: widget.kronologiController,
            node: kronologiNode,
            size: widget.size,
            label: "Kronologis Kejadian",
            type: TextInputType.text,
            maxLines: 8,
          ),
        ],
      ),
    );
  }
}
