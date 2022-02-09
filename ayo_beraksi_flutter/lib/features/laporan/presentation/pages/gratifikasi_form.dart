import 'dart:async';

import 'package:ayo_beraksi_flutter/core/widgets/common/agreement.dart';
import 'package:ayo_beraksi_flutter/core/widgets/common/custom_back_button.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/gratifikasi/gratifikasi_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/laporan_list/laporan_list_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/widgets/gratifikasi/first_section_gratifikasi.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/widgets/gratifikasi/gratifikasi_consumer.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/widgets/gratifikasi/second_section_gratifikasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GratifikasiForm extends StatefulWidget {
  const GratifikasiForm({Key? key}) : super(key: key);

  @override
  State<GratifikasiForm> createState() => _GratifikasiFormState();
}

class _GratifikasiFormState extends State<GratifikasiForm> {
  final formFieldKey = GlobalKey<FormState>();
  bool _isChecked = false;

  final namaController = TextEditingController();
  final jabatanController = TextEditingController();
  final instansiController = TextEditingController();
  final tanggalController = TextEditingController();
  final kronologiController = TextEditingController();

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
              children: [
                const CustomBackButton(title: 'Laporan Gratifikasi'),
                FirstSectionGratifikasi(
                  size: size,
                  namaController: namaController,
                  jabatanController: jabatanController,
                  instansiController: instansiController,
                ),
                SecondSectionGratifikasi(
                  size: size,
                  tanggalController: tanggalController,
                  kronologiController: kronologiController,
                ),
                Agreement(
                  size: size,
                  onChanged: (value) => setState(() => _isChecked = value),
                ),
                GratifikasiConsumer(size: size),
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isChecked
                          ? () {
                              if (formFieldKey.currentState!.validate()) {
                                BlocProvider.of<GratifikasiBloc>(context).add(AddLaporanGratifikasi({
                                  "nama_terlapor": namaController.text,
                                  "jabatan": jabatanController.text,
                                  "instansi": instansiController.text,
                                  "tanggal_kejadian": tanggalController.text,
                                  "kronologis_kejadian": kronologiController.text,
                                  "status": "Sedang diproses"
                                }));
                              }
                            }
                          : null,
                      child: const Text("Kirim"),
                    ),
                  ),
                ),
                BlocListener<GratifikasiBloc, GratifikasiState>(
                  listener: (context, state) {
                    if (state is GratifikasiSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: kPrimaryColor,
                          content: Text('Laporan Gratifikasi Anda Berhasil Dikirim!'),
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
