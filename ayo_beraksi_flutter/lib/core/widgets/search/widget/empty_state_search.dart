import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class EmptyStateSearch extends StatelessWidget {
  const EmptyStateSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/search.png",
            scale: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(top: kDefaultPadding * 2),
            child: Text(
              "Apa yang ingin anda cari?",
              style: TextStyle(color: Colors.black54, fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
