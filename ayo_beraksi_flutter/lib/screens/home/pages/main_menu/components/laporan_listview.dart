import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
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
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foundLaporan[index]["title"],
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            foundLaporan[index]["subtitle"],
                            style: const TextStyle(color: Colors.black26, fontSize: 13),
                            softWrap: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              foundLaporan[index]["date"],
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
        ));
  }
}
