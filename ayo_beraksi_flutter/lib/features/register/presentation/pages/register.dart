import 'dart:async';

import 'package:ayo_beraksi_flutter/common/custom_password_field.dart';
import 'package:ayo_beraksi_flutter/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/register/presentation/bloc/register_bloc.dart';
import 'package:ayo_beraksi_flutter/features/register/presentation/widgets/register_consumer.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/pages/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final namaController = TextEditingController();

  final FocusNode namaNode = FocusNode();

  final emailController = TextEditingController();

  final FocusNode emailNode = FocusNode();

  final tlpController = TextEditingController();

  final FocusNode tlpNode = FocusNode();

  final passController = TextEditingController();

  final FocusNode passNode = FocusNode();

  bool isChecked = false;
  bool validate = false;
  final formFieldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: kDefaultPadding + 5, right: kDefaultPadding + 5, top: kDefaultPadding * 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Buat Akun",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: kDefaultPadding * 2),
                child: Form(
                  key: formFieldKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: namaController,
                        node: namaNode,
                        size: size,
                        icon: const Icon(Icons.person_outline),
                        label: "Nama",
                        type: TextInputType.text,
                      ),
                      CustomTextField(
                        controller: emailController,
                        node: emailNode,
                        size: size,
                        icon: const Icon(Icons.mail_outline),
                        label: "Email",
                        type: TextInputType.emailAddress,
                      ),
                      CustomTextField(
                        controller: tlpController,
                        node: tlpNode,
                        size: size,
                        icon: const Icon(Icons.phone_outlined),
                        label: "Nomor Telepon",
                        type: TextInputType.number,
                      ),
                      CustomPasswordField(
                        controller: passController,
                        node: passNode,
                        size: size,
                        icon: Icons.lock_outline,
                        label: "Kata Sandi",
                      ),
                      Row(
                        children: [
                          Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kPrimaryColor),
                              value: isChecked,
                              onChanged: (bool? value) => setState(() => isChecked = value!)),
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(text: "Saya menyetujui", style: TextStyle(color: Colors.black87)),
                              TextSpan(
                                  text: " Syarat & Ketentuan",
                                  recognizer: TapGestureRecognizer()..onTap = () {},
                                  style: const TextStyle(color: kPrimaryColor)),
                              const TextSpan(text: "\ndan", style: TextStyle(color: Colors.black87)),
                              TextSpan(
                                  text: " Kebijakan Privasi",
                                  recognizer: TapGestureRecognizer()..onTap = () {},
                                  style: const TextStyle(color: kPrimaryColor)),
                              const TextSpan(text: " yang berlaku", style: TextStyle(color: Colors.black87)),
                            ]),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              RegisterConsumer(size: size),
              Padding(
                padding: const EdgeInsets.only(top: kDefaultPadding * 2),
                child: SizedBox(
                  width: size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isChecked
                        ? () {
                            if (formFieldKey.currentState!.validate()) {
                              BlocProvider.of<RegisterBloc>(context).add(RegisterUser({
                                'name': namaController.text,
                                'email': emailController.text,
                                'password': passController.text,
                                'no_telp': tlpController.text,
                                'role_id': 7
                              }));
                            }
                          }
                        : null,
                    child: const Text("Daftar"),
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: const Text("Masuk"))
                  ],
                ),
              ),
              BlocListener<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: kPrimaryColor,
                        content: Text('Pendaftaran Berhasil!'),
                      ),
                    );
                    Timer(
                      const Duration(seconds: 2),
                      () => Navigator.of(context).pop(),
                    );
                  }
                },
                child: const SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
