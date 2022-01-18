import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/pencarian/components/header_with_search.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/pencarian/components/last_search.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/pencarian/components/search_notfound.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/pencarian/components/empty_state_search.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/pencarian/components/search_result.dart';
import 'package:flutter/material.dart';

class Pencarian extends StatefulWidget {
  const Pencarian({Key? key}) : super(key: key);

  @override
  State<Pencarian> createState() => _PencarianState();
}

class _PencarianState extends State<Pencarian> {
  bool isFocused = false;

  final searchNode = FocusNode();

  final List<Map<String, dynamic>> _allLaporan = [
    {"id": 1, "title": "Laporan Pengaduan Masyarakat Mengenai Pelayanan Publik", "date": "29"},
    {"id": 2, "title": "Laporan Pengaduan Masyarakat Mengenai Pelayanan Publik", "date": "40"},
    {"id": 3, "title": "Laporan Pengaduan Masyarakat Mengenai Pelayanan Publik", "date": "5"},
    {"id": 4, "title": "Laporan Pengaduan Masyarakat Mengenai Pelayanan Publik", "date": "35"},
    {"id": 5, "title": "Laporan Pengaduan Masyarakat Mengenai Pelayanan Publik", "date": "21"},
    {"id": 6, "title": "Laporan Pengaduan Masyarakat Mengenai Pelayanan Publik", "date": "55"},
    {"id": 7, "title": "Laporan Pengaduan Masyarakat Mengenai Pelayanan Publik", "date": "30"},
    {"id": 8, "title": "Laporan Pengaduan Masyarakat Mengenai Pelayanan Publik", "date": "14"},
    {"id": 9, "title": "Laporan Gratifikasi", "date": "100"},
    {"id": 10, "title": "Laporan Penyuapan", "date": "32"},
  ];

  List<Map<String, dynamic>> _foundLaporan = [];

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty) {
      results = _allLaporan;
    } else {
      results = _allLaporan
          .where((laporan) => laporan["title"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundLaporan = results;
    });
  }

  @override
  void initState() {
    searchNode.addListener(() {
      if (searchNode.hasFocus) {
        setState(() => isFocused = true);
      } else {
        setState(() => isFocused = false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        top: kDefaultPadding * 2,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderwithSearch(
              searchNode: searchNode,
              searchTextField: TextField(
                focusNode: searchNode,
                onSubmitted: (value) => _runFilter(value),
                decoration: const InputDecoration(
                  hintText: "Cari",
                  hintStyle: TextStyle(color: Colors.black12),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search_outlined,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            isFocused
                ? Column(
                    children: [
                      const LastSearch(),
                      Padding(
                        padding: const EdgeInsets.only(top: kDefaultPadding),
                        child: SearchResult(foundLaporan: _foundLaporan),
                      )
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      const EmptyStateSearch()
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
