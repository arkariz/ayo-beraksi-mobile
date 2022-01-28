import 'dart:async';

import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/core/widgets/common/custom_back_button.dart';
import 'package:ayo_beraksi_flutter/core/widgets/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/name_bloc/name_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeNameScreen extends StatefulWidget {
  const ChangeNameScreen({Key? key}) : super(key: key);

  @override
  State<ChangeNameScreen> createState() => _ChangeNameScreenState();
}

class _ChangeNameScreenState extends State<ChangeNameScreen> {
  final nameController = TextEditingController();

  final nameNode = FocusNode();

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
                  child: CustomBackButton(title: "Ubah Nama"),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: kDefaultPadding),
                  child: Text("Anda hanya dapat mengubah nama 1 kali dalam sebulan. Pastikan nama sudah benar."),
                ),
                CustomTextField(
                  icon: const Icon(Icons.person_outline),
                  controller: nameController,
                  node: nameNode,
                  size: size,
                  label: "nama",
                  type: TextInputType.text,
                ),
                SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formFieldKey.currentState!.validate()) {
                        BlocProvider.of<NameBloc>(context).add(ChangeName({"name": nameController.text}));
                      }
                    },
                    child: const Text("Simpan"),
                  ),
                ),
                const ChangeProfileSnackBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChangeProfileSnackBar extends StatelessWidget {
  const ChangeProfileSnackBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NameBloc, NameState>(
      listener: (context, state) {
        if (state is ChangeNameSuccess) {
          BlocProvider.of<LoginBloc>(context).add(CheckUserLogin());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              backgroundColor: kPrimaryColor,
              content: Text('Nama anda berhasil diubah'),
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
              duration: Duration(seconds: 1),
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
