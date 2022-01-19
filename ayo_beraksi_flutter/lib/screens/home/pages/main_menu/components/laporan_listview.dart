import 'package:flutter/material.dart';

class LaporanListView extends StatelessWidget {
  const LaporanListView({Key? key, required this.foundLaporan}) : super(key: key);

  final List<Map<String, dynamic>> foundLaporan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.68,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
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
        ));
  }
}
