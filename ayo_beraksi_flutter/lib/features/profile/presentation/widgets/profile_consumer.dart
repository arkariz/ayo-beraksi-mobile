import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/name_bloc/name_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileConsumer extends StatelessWidget {
  const ProfileConsumer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<NameBloc>(context),
      builder: (context, NameState state) {
        if (state is ChangeNameFailed) {
          return SizedBox(
              width: size.width,
              child: Center(
                  child: Text(
                state.error!.message,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).errorColor),
              )));
        }
        if (state is ChangeNameSuccess) {
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message!.message)));
          // return Text(state.message!.message);
        }
        return const SizedBox();
      },
      listener: (BuildContext context, NameState state) {
        if (state is LoginDone) {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => OTPScreen(
          //             phoneNumber: emailController.text,
          //           )),
          // );
        }
      },
    );
  }
}
