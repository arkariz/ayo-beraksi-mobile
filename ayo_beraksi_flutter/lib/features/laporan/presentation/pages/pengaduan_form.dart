import 'dart:async';

import 'package:ayo_beraksi_flutter/core/widgets/agreement.dart';
import 'package:ayo_beraksi_flutter/core/widgets/custom_back_button.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/laporan_list/laporan_list_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/pengaduan/pengaduan_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/widgets/pengaduan/first_section_pengaduan.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/widgets/pengaduan/pengaduan_consumer.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/widgets/pengaduan/second_section_pengaduan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PengaduanForm extends StatefulWidget {
  const PengaduanForm({Key? key}) : super(key: key);

  @override
  State<PengaduanForm> createState() => _PengaduanFormState();
}

class _PengaduanFormState extends State<PengaduanForm> {
  final formFieldKey = GlobalKey<FormState>();
  bool _isChecked = false;

  final kepadaController = TextEditingController();
  final nikController = TextEditingController();
  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final laporanController = TextEditingController();
  final saranController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: kDefaultPadding + 5,
          right: kDefaultPadding + 5,
          top: kDefaultPadding * 3,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formFieldKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(title: 'Laporan Pengaduan'),
                FirstSectionPengaduan(
                  size: size,
                  nikController: nikController,
                  kepadaController: kepadaController,
                  namaController: namaController,
                  alamatController: alamatController,
                ),
                SecondSectionPengaduan(
                  size: size,
                  laporanController: laporanController,
                  saranController: saranController,
                ),
                Agreement(
                  size: size,
                  onChanged: (value) => setState(() => _isChecked = value),
                ),
                PengaduanConsumer(size: size),
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isChecked
                          ? () {
                              if (formFieldKey.currentState!.validate()) {
                                BlocProvider.of<PengaduanBloc>(context).add(AddLaporanPengaduan({
                                  "nama_ketua": kepadaController.text,
                                  "alamat": alamatController.text,
                                  "nik": nikController.text,
                                  "uraian_laporan": laporanController.text,
                                  "saran_masukan": saranController.text,
                                }));
                              }
                            }
                          : null,
                      child: const Text("Kirim"),
                    ),
                  ),
                ),
                BlocListener<PengaduanBloc, PengaduanState>(
                  listener: (context, state) {
                    if (state is PengaduanSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: kPrimaryColor,
                          content: Text('Pengaduan Anda Berhasil Dikirim!'),
                        ),
                      );

                      BlocProvider.of<LaporanListBloc>(context).add(GetLaporanList());

                      Timer(
                        const Duration(seconds: 2),
                        () => Navigator.of(context).pop(),
                      );
                    }
                  },
                  child: const SizedBox(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
