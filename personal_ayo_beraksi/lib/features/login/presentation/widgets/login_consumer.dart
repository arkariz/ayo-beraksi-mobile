import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/otp.dart';

class LoginConsumer extends StatelessWidget {
  const LoginConsumer({
    Key? key,
    required this.size,
    required this.emailController,
  }) : super(key: key);

  final Size size;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<LoginBloc>(context),
      builder: (context, LoginState state) {
        if (state is LoginDone) {
          print("test ${state.user!.token}");
        }
        if (state is LoginError) {
          return SizedBox(
              width: size.width,
              child: Center(
                  child: Text(
                "Pastikan Email atau Password yang ada masukkan benar",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).errorColor),
              )));
        }

        return const SizedBox();
      },
      listener: (BuildContext context, LoginState state) {
        if (state is LoginDone) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => OTPScreen(
                      phoneNumber: emailController.text,
                    )),
          );
        }
      },
    );
  }
}
