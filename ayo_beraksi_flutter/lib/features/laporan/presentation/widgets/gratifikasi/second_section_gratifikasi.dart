import 'package:ayo_beraksi_flutter/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class SecondSectionGratifikasi extends StatefulWidget {
  const SecondSectionGratifikasi({
    Key? key,
    required this.size,
    required this.tanggalController,
    required this.kronologiController,
  }) : super(key: key);

  final Size size;
  final TextEditingController tanggalController;

  final TextEditingController kronologiController;

  @override
  State<SecondSectionGratifikasi> createState() => _SecondSectionGratifikasiState();
}

class _SecondSectionGratifikasiState extends State<SecondSectionGratifikasi> {
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
              controller: widget.tanggalController,
              node: tanggalNode,
              size: widget.size,
              label: "Tanggal Kejadian",
              type: TextInputType.text,
              suffixIcon: const Icon(
                Icons.calendar_today_rounded,
                color: kPrimaryColor,
              ),
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
