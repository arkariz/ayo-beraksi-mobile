import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.controller,
    required this.node,
    required this.size,
    this.icon,
    required this.label,
    required this.type,
    this.initialValue,
    this.maxLines,
    this.suffixIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode node;
  final Size size;
  final Icon? icon;
  final Icon? suffixIcon;
  final String label;
  final TextInputType type;
  String? initialValue;
  final int? maxLines;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: SizedBox(
        width: widget.size.width,
        child: TextFormField(
          maxLines: widget.maxLines,
          initialValue: widget.initialValue ?? null,
          keyboardType: widget.type,
          focusNode: widget.node,
          controller: widget.controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Kolom Tidak Boleh Kosong';
            }
            return null;
          },
          decoration: InputDecoration(
            alignLabelWithHint: true,
            prefixIcon: widget.icon,
            labelStyle: const TextStyle(color: Colors.black38),
            labelText: widget.label,
            suffixIcon: widget.suffixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.black26)),
          ),
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
