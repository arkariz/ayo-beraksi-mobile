import 'dart:async';

import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/core/widgets/custom_back_button.dart';
import 'package:ayo_beraksi_flutter/core/widgets/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/name_bloc/name_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/phone_bloc/phone_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePhoneScreen extends StatefulWidget {
  const ChangePhoneScreen({Key? key}) : super(key: key);

  @override
  State<ChangePhoneScreen> createState() => _ChangePhoneScreenState();
}

class _ChangePhoneScreenState extends State<ChangePhoneScreen> {
  final phoneController = TextEditingController();

  final phoneNode = FocusNode();

  final formFieldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        padding: const EdgeInsets.only(
          left: kDefaultPadding + 5,
          right: kDefaultPadding + 5,
          top: kDefaultPadding * 3,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formFieldKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: kDefaultPadding),
                  child: CustomBackButton(title: "Ubah Nomor Ponsel"),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: kDefaultPadding),
                  child: Text(
                      "Anda hanya dapat mengubah nomor ponsel 1 kali dalam sebulan. Pastikan nomor ponsel sudah benar."),
                ),
                CustomTextField(
                  icon: const Icon(Icons.phone_enabled_outlined),
                  controller: phoneController,
                  node: phoneNode,
                  size: size,
                  label: "Nomor Ponsel",
                  type: TextInputType.number,
                ),
                SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formFieldKey.currentState!.validate()) {
                        BlocProvider.of<PhoneBloc>(context).add(ChangeTeleponEvent({"no_telp": phoneController.text}));
                      }
                    },
                    child: const Text("Simpan"),
                  ),
                ),
                const ChangePhoneSnackBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChangePhoneSnackBar extends StatelessWidget {
  const ChangePhoneSnackBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneBloc, PhoneState>(
      listener: (context, state) {
        if (state is ChangeTeleponSuccess) {
          BlocProvider.of<LoginBloc>(context).add(CheckUserLogin());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              backgroundColor: kPrimaryColor,
              content: Text('Nomor Ponsel anda berhasil diubah'),
            ),
          );
          Timer(
            const Duration(seconds: 2),
            () => Navigator.of(context).pop(),
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
    );
  }
}
