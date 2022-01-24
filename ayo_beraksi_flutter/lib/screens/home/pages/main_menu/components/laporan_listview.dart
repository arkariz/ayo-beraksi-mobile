import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';
import 'package:flutter/material.dart';

class LaporanListView extends StatelessWidget {
  const LaporanListView({Key? key, required this.foundLaporan}) : super(key: key);

  final List<LaporanItem>? foundLaporan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.60,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: Align(
            alignment: Alignment.topCenter,
            child: ListView.builder(
              shrinkWrap: true,
              reverse: true,
              itemCount: foundLaporan?.length ?? 0,
              itemBuilder: (context, index) => Card(
                key: ValueKey(foundLaporan?[index].id ?? 0),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              foundLaporan?[index].tipeLaporan ?? "empty",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              foundLaporan?[index].deskripsiStatus ??
                                  "Laporan sudah kami terima dan akan segera kami proses",
                              style: const TextStyle(color: Colors.black26, fontSize: 13),
                              softWrap: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                foundLaporan?[index].tanggalPelaporan ?? "empty",
                                style: const TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.download),
                        color: kPrimaryColor,
                        iconSize: 24,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
