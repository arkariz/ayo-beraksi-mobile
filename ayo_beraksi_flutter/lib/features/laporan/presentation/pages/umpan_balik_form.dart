import 'package:ayo_beraksi_flutter/common/agreement.dart';
import 'package:ayo_beraksi_flutter/common/custom_back_button.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/widgets/umpan_balik/first_section_umpan_balik.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/widgets/umpan_balik/second_section_umpan_balik.dart';
import 'package:flutter/material.dart';

class UmpanBalikForm extends StatefulWidget {
  const UmpanBalikForm({Key? key}) : super(key: key);

  @override
  State<UmpanBalikForm> createState() => _UmpanBalikFormState();
}

class _UmpanBalikFormState extends State<UmpanBalikForm> {
  final formFieldKey = GlobalKey<FormState>();
  bool _isChecked = false;
  bool _isBad = true;
  double rating = 0.0;
  int idSelected = 0;

  final listChoices = <ItemChoice>[
    ItemChoice(1, 'Baik'),
    ItemChoice(2, 'Berkomiten'),
    ItemChoice(3, 'Jujur'),
  ];

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
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: size.height * 0.9,
            child: Form(
              key: formFieldKey,
              child: Column(
                children: [
                  const CustomBackButton(title: 'Umpan Balik'),
                  FirstSectionUmpanBalik(
                    size: size,
                    onChangeRate: (rating) => setState(() {
                      this.rating = rating;
                      if (this.rating <= 3) {
                        _isBad = true;
                      } else {
                        _isBad = false;
                      }
                    }),
                  ),
                  _isBad
                      ? SecondSectionUmpanBalik(size: size)
                      : Container(
                          padding: const EdgeInsets.only(top: kDefaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Bagaimana tanggapan saudara terhadap pelayanan kami?",
                                style: TextStyle(fontSize: 15),
                              ),
                              Wrap(
                                children: techChips(),
                              )
                            ],
                          ),
                        ),
                  const Spacer(),
                  Agreement(
                    size: size,
                    onChanged: (value) => setState(() => _isChecked = value),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding),
                    child: SizedBox(
                      width: size.width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isChecked
                            ? () {
                                if (formFieldKey.currentState!.validate()) {
                                  null;
                                }
                              }
                            : null,
                        child: const Text("Kirim"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
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
