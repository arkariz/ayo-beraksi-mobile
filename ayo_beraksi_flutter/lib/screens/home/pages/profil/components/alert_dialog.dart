import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:ayo_beraksi_flutter/screens/launch/launch_screen.dart';
import 'package:flutter/cupertino.dart';

class AlrtDialog extends StatelessWidget {
  const AlrtDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text("Anda yakin ingin keluar?"),
      actions: [
        CupertinoDialogAction(
            textStyle: TextStyle(color: kPrimaryColor),
            child: Text("No"),
            onPressed: () {
              Navigator.pop(context);
            }),
        CupertinoDialogAction(
            textStyle: TextStyle(color: kPrimaryColor),
            child: Text("Yes"),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => LaunchScreen()),
              );
            })
      ],
    );
  }
}
