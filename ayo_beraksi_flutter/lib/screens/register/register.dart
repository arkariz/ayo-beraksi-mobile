import 'package:ayo_beraksi_flutter/common/custom_password_field.dart';
import 'package:ayo_beraksi_flutter/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:ayo_beraksi_flutter/screens/home/home_screen.dart';
import 'package:ayo_beraksi_flutter/screens/login/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  _showToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "You must check this box",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: kPrimaryColor,
        textColor: Colors.white);
  }

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
                        icon: Icons.person_outline,
                        label: "Nama",
                        type: TextInputType.text,
                      ),
                      CustomTextField(
                        controller: emailController,
                        node: emailNode,
                        size: size,
                        icon: Icons.mail_outline,
                        label: "Email",
                        type: TextInputType.emailAddress,
                      ),
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
                        label: "Kata Sandi",
                      ),
                      Row(
                        children: [
                          // CheckboxFormField(),
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
                                  text: " Syarat & Ketentuan",
                                  recognizer: TapGestureRecognizer()..onTap = () {},
                                  style: const TextStyle(color: kPrimaryColor)),
                            ]),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: kDefaultPadding * 2),
                child: SizedBox(
                  width: size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isChecked
                        ? () {
                            if (formFieldKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const HomeScreen()),
                              );
                            }
                          }
                        : null, //_showToast(context),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
