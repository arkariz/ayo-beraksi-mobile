import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';
import 'package:ayo_beraksi_flutter/core/widgets/search/widget/search_notfound.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.foundLaporan}) : super(key: key);

  final List<LaporanItem> foundLaporan;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.65,
      child: foundLaporan.isNotEmpty
          ? MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: foundLaporan.length,
                  itemBuilder: (context, index) => NotificationItem(
                        size: size,
                        foundLaporan: foundLaporan[index],
                      )),
            )
          : const SearchNotFound(),
    );
  }
}

class NotificationItem extends StatefulWidget {
  const NotificationItem({Key? key, required this.size, required this.foundLaporan}) : super(key: key);

  final Size size;
  final LaporanItem foundLaporan;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isRead = true),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.article_rounded),
            SizedBox(
              width: widget.size.width * 0.65,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.foundLaporan.tipeLaporan,
                      style: const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.foundLaporan.deskripsiStatus ?? "Laporan sudah kami terima dan akan segera kami proses",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        widget.foundLaporan.tanggalPelaporan ?? "empty",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black26,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
