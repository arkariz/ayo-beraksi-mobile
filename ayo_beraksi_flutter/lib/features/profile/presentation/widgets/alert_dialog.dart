import 'package:ayo_beraksi_flutter/common/launch/launch_screen.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              BlocProvider.of<LoginBloc>(context).add(DestroyToken());
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => const LaunchScreen()),
              );
            })
      ],
    );
  }
}
