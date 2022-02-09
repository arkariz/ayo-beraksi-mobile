import 'package:ayo_beraksi_flutter/features/laporan/domain/entities/laporan_list.dart';
import 'package:flutter/material.dart';

class LaporanListviewContent extends StatelessWidget {
  const LaporanListviewContent({
    Key? key,
    required this.size,
    required this.foundLaporan,
    required this.index,
  }) : super(key: key);

  final Size size;
  final List<LaporanItem>? foundLaporan;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: size.width * 0.80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TipeLaporan(foundLaporan: foundLaporan, index: index),
          DetailLaporan(foundLaporan: foundLaporan, index: index, size: size)
        ],
      ),
    );
  }
}

class StatusSign extends StatelessWidget {
  const StatusSign({
    Key? key,
    required this.foundLaporan,
    required this.index,
  }) : super(key: key);

  final List<LaporanItem>? foundLaporan;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        foundLaporan?[index].status == "Sedang diproses"
            ? Image.asset("assets/icons/proses-vector.png")
            : const SizedBox(),
        foundLaporan?[index].status == "Diterima" ? Image.asset("assets/icons/diterima-vector.png") : const SizedBox(),
        foundLaporan?[index].status == "Ditolak" ? Image.asset("assets/icons/ditolak-vector.png") : const SizedBox(),
      ],
    );
  }
}

class TipeLaporan extends StatelessWidget {
  const TipeLaporan({
    Key? key,
    required this.foundLaporan,
    required this.index,
  }) : super(key: key);

  final List<LaporanItem>? foundLaporan;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      foundLaporan?[index].tipeLaporan ?? "empty",
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }
}

class DetailLaporan extends StatelessWidget {
  const DetailLaporan({
    Key? key,
    required this.foundLaporan,
    required this.index,
    required this.size,
  }) : super(key: key);

  final List<LaporanItem>? foundLaporan;
  final int index;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TanggalLaporan(foundLaporan: foundLaporan, index: index),
          StatusLaporan(foundLaporan: foundLaporan, index: index),
          IconButton(
            icon: const Icon(Icons.download),
            color: Colors.blueAccent[200],
            iconSize: 24,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class StatusLaporan extends StatelessWidget {
  const StatusLaporan({
    Key? key,
    required this.foundLaporan,
    required this.index,
  }) : super(key: key);

  final List<LaporanItem>? foundLaporan;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        foundLaporan?[index].status == "Sedang diproses"
            ? Image.asset(
                "assets/icons/proses-icon.png",
                width: 17,
              )
            : const SizedBox(),
        foundLaporan?[index].status == "Diterima"
            ? Image.asset(
                "assets/icons/diterima-icon.png",
                width: 17,
              )
            : const SizedBox(),
        foundLaporan?[index].status == "Ditolak"
            ? Image.asset(
                "assets/icons/ditolak-icon.png",
                width: 17,
              )
            : const SizedBox(),
        foundLaporan?[index].status == "Sedang diproses"
            ? Text(
                "Diproses",
                style: TextStyle(
                  color: Colors.yellowAccent[400],
                  fontSize: 13,
                ),
              )
            : const SizedBox(),
        foundLaporan?[index].status == "Diterima"
            ? Text(
                "${foundLaporan?[index].status}",
                style: TextStyle(
                  color: Colors.greenAccent[400],
                  fontSize: 13,
                ),
              )
            : const SizedBox(),
        foundLaporan?[index].status == "Ditolak"
            ? Text(
                "${foundLaporan?[index].status}",
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class TanggalLaporan extends StatelessWidget {
  const TanggalLaporan({
    Key? key,
    required this.foundLaporan,
    required this.index,
  }) : super(key: key);

  final List<LaporanItem>? foundLaporan;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_today_outlined,
          color: Colors.black54,
          size: 15,
        ),
        const SizedBox(width: 5),
        Text(
          foundLaporan?[index].tanggalPelaporan ?? "empty",
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
