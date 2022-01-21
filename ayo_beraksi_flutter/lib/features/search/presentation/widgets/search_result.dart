import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';
import 'package:ayo_beraksi_flutter/features/search/presentation/widgets/search_notfound.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.foundLaporan}) : super(key: key);

  final List<LaporanItem> foundLaporan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: foundLaporan.isNotEmpty
          ? MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: foundLaporan.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(foundLaporan[index].id),
                  child: ListTile(
                    leading: Text(
                      foundLaporan[index].id.toString(),
                    ),
                    title: Text(foundLaporan[index].tipeLaporan),
                    subtitle: Text(foundLaporan[index].tanggalPelaporan),
                  ),
                ),
              ),
            )
          : const SearchNotFound(),
    );
  }
}
