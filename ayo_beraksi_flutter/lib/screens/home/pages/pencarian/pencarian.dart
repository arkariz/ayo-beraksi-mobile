import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/pencarian/components/header_with_search.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/pencarian/components/search_result.dart';
import 'package:flutter/material.dart';

class Pencarian extends StatelessWidget {
  const Pencarian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        top: kDefaultPadding * 2,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const HeaderwithSearch(),
            SizedBox(
              height: size.height * 0.2,
            ),
            const SearchResult()
          ],
        ),
      ),
    );
  }
}
