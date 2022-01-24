import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/core/widgets/custom_password_field.dart';
import 'package:ayo_beraksi_flutter/core/widgets/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/features/register/presentation/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../widgets/login_consumer.dart';

class Login extends HookWidget {
  Login({Key? key}) : super(key: key);

  final emailController = TextEditingController();

  final FocusNode emailNode = FocusNode();

  final passController = TextEditingController();

  final FocusNode passNode = FocusNode();

  final formFieldKey = GlobalKey<FormState>();

  final Map<String, dynamic> auth = {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            padding: const EdgeInsets.only(
              left: kDefaultPadding + 5,
              right: kDefaultPadding + 5,
              top: kDefaultPadding * 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  child: Text(
                    "Masuk",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding * 1.5,
                ),
                Form(
                  key: formFieldKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: emailController,
                        node: emailNode,
                        size: size,
                        icon: const Icon(Icons.phone_outlined),
                        label: "Email",
                        type: TextInputType.text,
                      ),
                      CustomPasswordField(
                          controller: passController,
                          node: passNode,
                          size: size,
                          icon: Icons.lock_outline,
                          label: "Kata sandi"),
                    ],
                  ),
                ),
                LoginConsumer(size: size, emailController: emailController),
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding * 2),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formFieldKey.currentState!.validate()) {
                          BlocProvider.of<LoginBloc>(context)
                              .add(GetUser({'email': emailController.text, 'password': passController.text}));
                        }
                      },
                      child: const Text("Masuk"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding * 1.5),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 1,
                          child: Container(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      const Text(
                        "Masuk dengan Google",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 1,
                          child: Container(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding * 1.5),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      label: const Text(
                        "Google",
                        style: TextStyle(color: Colors.black),
                      ),
                      icon: Image.asset("assets/icons/google.png"),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("belum punya akun?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const Register()),
                            );
                          },
                          child: const Text("Daftar"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
