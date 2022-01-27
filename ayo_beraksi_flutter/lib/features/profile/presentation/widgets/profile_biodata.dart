import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/pages/change_name_screen.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/pages/change_phone_screen.dart';
import 'package:flutter/material.dart';

class ProfileBiodata extends StatelessWidget {
  const ProfileBiodata({
    Key? key,
    required this.name,
    required this.phone,
    required this.email,
  }) : super(key: key);

  final String name;
  final String phone;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiodataItem(
          icon: const Icon(Icons.person_outline, color: Colors.black54),
          label: "NAMA",
          value: name,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangeNameScreen(),
              ),
            );
          },
        ),
        const SizedBox(height: kDefaultPadding),
        BiodataItem(
          icon: const Icon(Icons.phone_outlined, color: Colors.black54),
          label: "NOMOR PONSEL",
          value: phone,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangePhoneScreen(),
              ),
            );
          },
        ),
        const SizedBox(height: kDefaultPadding),
        BiodataItem(
          icon: const Icon(Icons.email_outlined, color: Colors.black54),
          label: "EMAIL",
          value: email,
          onPressed: () {},
        ),
        const SizedBox(
          height: kDefaultPadding * 3,
        ),
      ],
    );
  }
}

class BiodataItem extends StatelessWidget {
  const BiodataItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onPressed,
  }) : super(key: key);

  final Icon icon;
  final String label;
  final String value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: icon,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.edit_outlined,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
