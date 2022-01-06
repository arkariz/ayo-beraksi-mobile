import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/pages/components/back_button.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/pages/components/backgroud_image.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/pages/components/text_description.dart';
import 'package:ayo_beraksi_flutter/screens/home/home_screen.dart';
import 'package:ayo_beraksi_flutter/features/register/presentation/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SubmitOTP extends StatelessWidget {
  SubmitOTP({Key? key}) : super(key: key);

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
              PinCodeTextField(
                appContext: context,
                keyboardType: TextInputType.number,
                cursorColor: kPrimaryColor.withOpacity(0.5),
                length: 5,
                onChanged: (string) {},
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    inactiveColor: Colors.black12,
                    activeColor: kPrimaryColor,
                    selectedColor: kPrimaryColor.withOpacity(0.8)),
              ),
              SizedBox(
                width: size.width,
                height: 50,
                child: ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
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
