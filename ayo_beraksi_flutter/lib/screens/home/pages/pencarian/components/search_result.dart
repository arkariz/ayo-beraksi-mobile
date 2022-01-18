import 'package:ayo_beraksi_flutter/screens/home/pages/pencarian/components/search_notfound.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.foundLaporan}) : super(key: key);

  final List<Map<String, dynamic>> foundLaporan;

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
                  key: ValueKey(foundLaporan[index]["id"]),
                  child: ListTile(
                    leading: Text(
                      foundLaporan[index]["id"].toString(),
                    ),
                    title: Text(foundLaporan[index]["title"]),
                    subtitle: Text(foundLaporan[index]["date"]),
                  ),
                ),
              ),
            )
          : const SearchNotFound(),
    );
  }
}
