import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:flutter/material.dart';

class Biodata extends StatelessWidget {
  Biodata({Key? key}) : super(key: key);

  final nameController = TextEditingController(text: "Rizky");
  final FocusNode nameNode = FocusNode();

  final tlpController = TextEditingController(text: "08765423134");
  final FocusNode tlpNode = FocusNode();

  final mailController = TextEditingController(text: "Rizky@gmail.com");
  final FocusNode mailNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(children: [
      BiodataTextField(
          controller: nameController, node: nameNode, size: size, icon: Icons.person_outline, label: "NAMA"),
      BiodataTextField(
        controller: tlpController,
        node: tlpNode,
        size: size,
        icon: Icons.phone_outlined,
        label: "NOMOR TELEPON",
      ),
      BiodataTextField(
        controller: mailController,
        node: mailNode,
        size: size,
        icon: Icons.mail_outline,
        label: "EMAIL",
      )
    ]);
  }
}

class BiodataTextField extends StatefulWidget {
  const BiodataTextField(
      {Key? key,
      required this.controller,
      required this.node,
      required this.size,
      required this.icon,
      required this.label})
      : super(key: key);

  final TextEditingController controller;
  final FocusNode node;
  final Size size;
  final IconData icon;
  final String label;

  @override
  _BiodataTextFieldState createState() => _BiodataTextFieldState();
}

class _BiodataTextFieldState extends State<BiodataTextField> {
  bool isReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: widget.size.width * 0.75,
            child: TextField(
              focusNode: widget.node,
              readOnly: isReadOnly ? true : false,
              controller: widget.controller,
              decoration: InputDecoration(
                  icon: Icon(widget.icon),
                  labelText: widget.label,
                  border: isReadOnly ? InputBorder.none : const OutlineInputBorder()),
              textInputAction: TextInputAction.done,
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() => isReadOnly = !isReadOnly);
                isReadOnly
                    ? FocusScope.of(context).requestFocus(FocusNode())
                    : FocusScope.of(context).requestFocus(widget.node);
              },
              icon: const Icon(
                Icons.edit_outlined,
                color: kPrimaryColor,
              ))
        ],
      ),
    );
  }
}
