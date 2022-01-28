import 'package:ayo_beraksi_flutter/core/widgets/common/launch_screen.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/features/notification/presentation/bloc/notification/notification_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/name_bloc/name_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/phone_bloc/phone_bloc.dart';
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
              BlocProvider.of<NameBloc>(context).add(ResetNameEvent());
              BlocProvider.of<PhoneBloc>(context).add(ResetPhoneEvent());
              BlocProvider.of<NotificationBloc>(context).add(NotificationInitial());
              Navigator.pushAndRemoveUntil(
                  context, CupertinoPageRoute(builder: (context) => const LaunchScreen()), (e) => false);
            })
      ],
    );
  }
}
