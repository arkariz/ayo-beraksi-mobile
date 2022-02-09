import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/laporan_list/laporan_list_bloc.dart';
import 'package:ayo_beraksi_flutter/core/widgets/home/main_menu/widget/laporan_listview/laporan_listview.dart';
import 'package:ayo_beraksi_flutter/core/widgets/home/main_menu/widget/laporan_listview/laporan_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaporanSection extends StatelessWidget {
  const LaporanSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LaporanHeader(),
          BlocBuilder<LaporanListBloc, LaporanListState>(
            builder: (context, state) {
              if (state is LaporanListSuccess) {
                if (state.laporanList != null) {
                  if (state.laporanList!.isNotEmpty) {
                    return LaporanListView(foundLaporan: state.laporanList!.reversed.toList());
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(top: kDefaultPadding * 3),
                      child: Image.asset("assets/images/complete.png"),
                    );
                  }
                }
              }
              if (state is LaporanListFiltered) {
                if (state.laporanList != null) {
                  if (state.laporanList!.isNotEmpty) {
                    return LaporanListView(foundLaporan: state.laporanList!.reversed.toList());
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(top: kDefaultPadding * 3),
                      child: Image.asset("assets/images/complete.png"),
                    );
                  }
                }
              }
              if (state is LaporanListFailed) {
                return Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding * 3),
                  child: Image.asset("assets/images/search-notfound.png"),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
