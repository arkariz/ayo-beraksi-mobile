import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:flutter/material.dart';

class NotifikasiBody extends StatefulWidget {
  const NotifikasiBody({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  State<NotifikasiBody> createState() => _NotifikasiBodyState();
}

class _NotifikasiBodyState extends State<NotifikasiBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationItem(size: widget.size),
        NotificationItem(size: widget.size),
        NotificationItem(size: widget.size),
        NotificationItem(size: widget.size),
        NotificationItem(size: widget.size),
        NotificationItem(size: widget.size),
        NotificationItem(size: widget.size),
        NotificationItem(size: widget.size),
        NotificationItem(size: widget.size),
        NotificationItem(size: widget.size),
        NotificationItem(size: widget.size),
        NotificationItem(size: widget.size),
      ],
    );
  }
}

class NotificationItem extends StatefulWidget {
  const NotificationItem({Key? key, required this.size}) : super(key: key);

  final Size size;

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
        color: isRead ? Colors.black12 : Colors.transparent,
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isRead
                ? const SizedBox()
                : const Icon(
                    Icons.brightness_1_rounded,
                    color: Colors.red,
                    size: 10,
                  ),
            const Icon(Icons.article_rounded),
            SizedBox(
              width: widget.size.width * 0.7,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Laporan Penyuapan Ditolak",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Pesanan Anda telah kami tolak karena, hal yang disampaikan tidak benar",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "3 menit yang lalu",
                        style: TextStyle(
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
