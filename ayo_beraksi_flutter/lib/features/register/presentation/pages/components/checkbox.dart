import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckboxFormField extends StatefulWidget {
  const CheckboxFormField({Key? key}) : super(key: key);

  @override
  _CheckboxFormFieldState createState() => _CheckboxFormFieldState();
}

class _CheckboxFormFieldState extends State<CheckboxFormField> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (state) {
        return Column(
          children: [
            Checkbox(
                value: checkBoxValue,
                onChanged: (value) {
                  checkBoxValue = value!;
                  state.didChange(value);
                }),
            // Text(
            //   state.errorText ?? '',
            //   style: TextStyle(color: Theme.of(context).errorColor),
            // )
          ],
        );
      },
      validator: (value) {
        if (!checkBoxValue) {
          Fluttertoast.showToast(
              msg: "You must check this box",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: kPrimaryColor,
              textColor: Colors.white);
        } //return 'You must check this box';
        return null;
      },
    );
  }
}
