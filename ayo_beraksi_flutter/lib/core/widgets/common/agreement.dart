import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class Agreement extends StatefulWidget {
  const Agreement({Key? key, required this.size, required this.onChanged}) : super(key: key);

  final Size size;
  final ValueChanged<bool>? onChanged;

  @override
  _AgreementState createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(kPrimaryColor),
            value: isChecked,
            onChanged: (bool? value) => setState(() {
                  isChecked = value!;
                  widget.onChanged!(value);
                })),
        const Flexible(
          child: Text(
            "dengan ini saya menyatakan bahwa data yang saya laporkan adalah benar dan dapat saya pertanggungjawabkan kebenarannya",
            style: TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }
}
