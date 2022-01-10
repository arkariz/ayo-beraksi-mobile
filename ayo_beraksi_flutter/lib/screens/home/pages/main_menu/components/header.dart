import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Header extends HookWidget {
  const Header({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            "Ayo\nBerAksi",
            style: TextStyle(color: kTitleColor, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(right: kDefaultPadding),
                  child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
                    if (state is ChangeNameInitial) {
                      return BlocBuilder<LoginBloc, LoginState>(
                        builder: (_, state) {
                          if (state is LoginDone) {
                            return Text(
                              "Hai, ${state.user!.name}",
                              style: const TextStyle(fontSize: 16),
                            );
                          }
                          return const SizedBox();
                        },
                      );
                    }
                    if (state is ChangeNameSuccess) {
                      return Text(
                        "Hai, ${state.message!.name}",
                        style: const TextStyle(fontSize: 16),
                      );
                    }
                    return const SizedBox();
                  })),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.jpg"),
                radius: 25,
              )
            ],
          )
        ],
      ),
    );
  }
}
