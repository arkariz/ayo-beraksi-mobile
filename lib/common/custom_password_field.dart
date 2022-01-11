import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    Key? key,
    required this.controller,
    required this.node,
    required this.size,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode node;
  final Size size;
  final IconData icon;
  final String label;

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: SizedBox(
        width: widget.size.width,
        child: TextFormField(
          obscureText: _isHidden,
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
              labelStyle: const TextStyle(color: Colors.black38),
              labelText: widget.label,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              suffixIcon: IconButton(
                onPressed: () => setState(() => _isHidden = !_isHidden),
                icon: Icon(_isHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined),
              )),
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
