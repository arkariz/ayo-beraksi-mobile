import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FirstSectionUmpanBalik extends StatelessWidget {
  FirstSectionUmpanBalik({
    Key? key,
    required this.size,
    required this.onChangeRate,
  }) : super(key: key);

  final Size size;

  final kronologiController = TextEditingController();
  final FocusNode kronologiNode = FocusNode();
  final Function(double) onChangeRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Berikan rating kepuasan saudara terhadap pelayanan kami.",
            style: TextStyle(fontSize: 15),
          ),
          Container(
            width: size.width,
            padding: const EdgeInsets.only(top: kDefaultPadding * 0.5),
            child: Center(
              child: RatingBar(
                  itemSize: 50,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 5),
                  ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      half: const Icon(
                        Icons.star_half,
                        color: Colors.yellow,
                      ),
                      empty: const Icon(
                        Icons.star_border_outlined,
                        color: Colors.yellow,
                      )),
                  onRatingUpdate: onChangeRate),
            ),
          )
        ],
      ),
    );
  }
}
