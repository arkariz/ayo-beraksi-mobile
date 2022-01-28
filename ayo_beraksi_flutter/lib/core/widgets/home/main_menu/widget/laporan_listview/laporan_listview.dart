import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';
import 'package:flutter/material.dart';

import 'laporan_listview_content.dart';

class LaporanListView extends StatelessWidget {
  const LaporanListView({Key? key, required this.foundLaporan}) : super(key: key);

  final List<LaporanItem>? foundLaporan;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.60,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: foundLaporan?.length ?? 0,
            itemBuilder: (context, index) => Card(
              key: ValueKey(foundLaporan?[index].id ?? 0),
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 0, top: 6, bottom: 6),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StatusSign(foundLaporan: foundLaporan, index: index),
                    LaporanListviewContent(size: size, foundLaporan: foundLaporan, index: index),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
