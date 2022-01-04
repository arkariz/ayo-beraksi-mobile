import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:ayo_beraksi_flutter/screens/launch/launch_screen.dart';
import 'package:flutter/cupertino.dart';

class AlrtDialog extends StatelessWidget {
  const AlrtDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: const Text("Anda yakin ingin keluar?"),
      actions: [
        CupertinoDialogAction(
            textStyle: const TextStyle(color: kPrimaryColor),
            child: const Text("No"),
            onPressed: () {
              Navigator.pop(context);
            }),
        CupertinoDialogAction(
            textStyle: const TextStyle(color: kPrimaryColor),
            child: const Text("Yes"),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => const LaunchScreen()),
              );
            })
      ],
    );
  }
}
