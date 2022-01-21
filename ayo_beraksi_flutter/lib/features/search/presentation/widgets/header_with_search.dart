import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/name_bloc/name_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderwithSearch extends StatelessWidget {
  const HeaderwithSearch({Key? key, required this.searchNode, required this.searchTextField}) : super(key: key);

  final FocusNode searchNode;
  final TextField searchTextField;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Row(
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
                      child: BlocBuilder<NameBloc, NameState>(builder: (context, state) {
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
          Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding * 2),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: searchTextField,
              ))
        ],
      ),
    );
  }
}
