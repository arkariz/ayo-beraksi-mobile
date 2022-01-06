import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/components/header.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/main_menu/components/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        top: kDefaultPadding * 2,
      ),
      child: Column(
        children: <Widget>[
          BlocBuilder<LoginBloc, LoginState>(
            builder: (_, state) {
              if (state is LoginLoading) {
                return const Text("Loading");
              }
              if (state is LoginError) {
                return Text("${state.error}");
              }
              if (state is LoginDone) {
                return Text(
                  "Hai, ${state.user!.name}",
                  style: const TextStyle(fontSize: 16),
                );
              }
              return const SizedBox();
            },
          ),
          Header(size: size),
          const Menu(),
        ],
      ),
    );
  }
}
