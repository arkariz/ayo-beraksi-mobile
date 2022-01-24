import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class LastSearch extends StatefulWidget {
  const LastSearch({Key? key}) : super(key: key);

  @override
  _LastSearchState createState() => _LastSearchState();
}

class _LastSearchState extends State<LastSearch> {
  int idSelected = 0;

  final listChoices = <ItemChoice>[
    ItemChoice(1, 'Baik'),
    ItemChoice(2, 'Berkomiten'),
    ItemChoice(3, 'Jujur'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Pencarian Terakhir",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Hapus Semua",
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              ),
            )
          ],
        ),
        Wrap(
          children: techChips(),
        )
      ],
    );
  }

  List<Widget> techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < listChoices.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: ChoiceChip(
          selectedColor: kSecondaryColor,
          disabledColor: kPrimaryColor,
          label: Text(listChoices[i].label),
          labelStyle: const TextStyle(color: Colors.white),
          selected: idSelected == i,
          onSelected: (bool value) {
            setState(() {
              idSelected = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}

class ItemChoice {
  final int id;
  final String label;

  ItemChoice(this.id, this.label);
}
