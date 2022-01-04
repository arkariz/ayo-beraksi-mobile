import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.node,
    required this.size,
    required this.icon,
    required this.label,
    required this.type,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode node;
  final Size size;
  final IconData icon;
  final String label;
  final TextInputType type;

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
            prefixIcon: Icon(widget.icon),
            labelStyle: TextStyle(color: Colors.black38),
            labelText: widget.label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
