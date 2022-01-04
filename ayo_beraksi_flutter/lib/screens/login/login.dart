import 'package:ayo_beraksi_flutter/common/custom_password_field.dart';
import 'package:ayo_beraksi_flutter/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:ayo_beraksi_flutter/screens/otp/otp.dart';
import 'package:ayo_beraksi_flutter/screens/register/register.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final tlpController = TextEditingController();
  final FocusNode tlpNode = FocusNode();

  final passController = TextEditingController();
  final FocusNode passNode = FocusNode();

  final formFieldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
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
                      controller: tlpController,
                      node: tlpNode,
                      size: size,
                      icon: Icons.phone_outlined,
                      label: "Nomor Telepon",
                      type: TextInputType.number,
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
              Padding(
                padding: const EdgeInsets.only(top: kDefaultPadding * 2),
                child: SizedBox(
                  width: size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formFieldKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPScreen(
                                    phoneNumber: tlpController.text,
                                  )),
                        );
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
        ));
  }
}
