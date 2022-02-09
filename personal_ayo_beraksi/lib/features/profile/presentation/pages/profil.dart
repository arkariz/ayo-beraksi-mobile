import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/name_bloc/name_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/widgets/alert_dialog.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/widgets/avatar.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/widgets/biodata.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/widgets/profile_consumer.dart';
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
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            const Avatar(),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            Biodata(),
            const SizedBox(
              height: kDefaultPadding * 3,
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
            BlocListener<NameBloc, NameState>(
              listener: (context, state) {
                if (state is ChangeNameSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: kPrimaryColor,
                      content: Text('Nama anda berhasil diubah'),
                    ),
                  );
                }
                if (state is ChangeNameFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: kPrimaryColor,
                      content: Text('Ada kesalahan'),
                    ),
                  );
                }
              },
              child: const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
