import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/laporan_list/laporan_list_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/pages/umpan_balik_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewHeader extends StatefulWidget {
  const ListViewHeader({Key? key}) : super(key: key);

  @override
  State<ListViewHeader> createState() => _ListViewHeaderState();
}

class _ListViewHeaderState extends State<ListViewHeader> {
  int idSelected = 0;

  final listChoices = <ItemChoice>[
    ItemChoice(1, 'Semua'),
    ItemChoice(2, 'Sedang diproses'),
    ItemChoice(3, 'Diterima'),
    ItemChoice(3, 'Ditolak'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Laporan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const Text(
            "Status Laporan anda",
            style: TextStyle(
              color: Colors.black26,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: techChips(),
                )
              ],
            ),
          ),
        ],
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
          label: BlocBuilder<LaporanListBloc, LaporanListState>(builder: (context, state) {
            var count = "";

            if (state is LaporanListSuccess) {
              if (state.laporanList != null) {
                count = state.laporanList!
                    .where((element) {
                      if (element.status != null) {
                        if (listChoices[i].label == "Semua") {
                          return true;
                        } else {
                          return element.status!.contains(listChoices[i].label);
                        }
                      } else {
                        return element.status?.contains(listChoices[i].label) ?? "Semua".contains(listChoices[i].label);
                      }
                    })
                    .toList()
                    .length
                    .toString();
              }
            }
            if (state is LaporanListFiltered) {
              if (state.alllaporan != null) {
                count = state.alllaporan!
                    .where((element) {
                      if (element.status != null) {
                        if (listChoices[i].label == "Semua") {
                          return true;
                        } else {
                          return element.status!.contains(listChoices[i].label);
                        }
                      } else {
                        return element.status?.contains(listChoices[i].label) ?? "Semua".contains(listChoices[i].label);
                      }
                    })
                    .toList()
                    .length
                    .toString();
              }
            }

            return Text("${listChoices[i].label} $count");
          }),
          labelStyle: const TextStyle(color: Colors.white),
          selected: idSelected == i,
          onSelected: (bool value) {
            setState(() {
              idSelected = i;
            });

            BlocProvider.of<LaporanListBloc>(context).add(FilterLaporanList(listChoices[i].label));
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
