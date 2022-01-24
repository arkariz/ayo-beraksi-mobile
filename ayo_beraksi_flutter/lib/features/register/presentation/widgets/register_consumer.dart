import 'package:ayo_beraksi_flutter/core/widgets/launch_screen.dart';
import 'package:ayo_beraksi_flutter/features/register/presentation/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterConsumer extends StatelessWidget {
  const RegisterConsumer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<RegisterBloc>(context),
      builder: (context, RegisterState state) {
        if (state is RegisterSuccess) {
          return const Text("success");
        }
        if (state is RegisterFailed) {
          return SizedBox(
              width: size.width,
              child: Center(
                  child: Text(
                "Ada Kesalahan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).errorColor),
              )));
        }
        return const SizedBox();
      },
      listener: (BuildContext context, RegisterState state) {
        if (state is RegisterSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LaunchScreen()),
          );
        }
      },
    );
  }
}
