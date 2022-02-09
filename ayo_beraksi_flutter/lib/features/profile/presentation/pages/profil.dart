import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/widgets/alert_dialog.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/widgets/avatar.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/widgets/profile_biodata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        top: kDefaultPadding * 2,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Avatar(),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return ProfileBiodata(
                  name: state.user!.name!,
                  phone: state.user!.noTlp!,
                  email: state.user!.email!,
                );
              },
            ),
            SizedBox(
              width: size.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlrtDialog();
                      });
                },
                icon: const Icon(Icons.exit_to_app_outlined),
                label: const Text("Keluar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
