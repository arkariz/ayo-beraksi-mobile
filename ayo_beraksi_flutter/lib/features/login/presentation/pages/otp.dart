import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/core/widgets/common/custom_text_field.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/widgets/back_button.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/widgets/backgroud_image.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/widgets/text_description.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/pages/submit_otp.dart';
import 'package:ayo_beraksi_flutter/features/register/presentation/pages/register.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  final tlpController = TextEditingController();
  final FocusNode tlpNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: kDefaultPadding + 5,
          right: kDefaultPadding + 5,
          top: kDefaultPadding * 3,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
              BackgroundImage(size: size),
              TextDescription(size: size),
              CustomTextField(
                controller: tlpController,
                node: tlpNode,
                size: size,
                icon: const Icon(Icons.phone_outlined),
                label: 'Nomor Telepon',
                type: TextInputType.number,
              ),
              SizedBox(
                width: size.width,
                height: 50,
                child: ElevatedButton(
                  child: const Text("Get OTP"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SubmitOTP()),
                    );
                  },
                ),
              ),
              Row(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
