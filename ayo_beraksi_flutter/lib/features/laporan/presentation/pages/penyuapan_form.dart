import 'package:ayo_beraksi_flutter/common/agreement.dart';
import 'package:ayo_beraksi_flutter/common/custom_back_button.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/penyuapan/laporan_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/widgets/penyuapan/add_penyuapan_consumer.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/widgets/penyuapan/first_section.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/widgets/penyuapan/second_section.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PenyuapanForm extends StatefulWidget {
  const PenyuapanForm({Key? key}) : super(key: key);

  @override
  State<PenyuapanForm> createState() => _PenyuapanFormState();
}

class _PenyuapanFormState extends State<PenyuapanForm> {
  final formFieldKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final jabatanController = TextEditingController();
  final instansiController = TextEditingController();
  final kasusController = TextEditingController();
  final nilaiController = TextEditingController();
  final lokasiController = TextEditingController();
  final tanggalController = TextEditingController();
  final kronologiController = TextEditingController();

  bool _isChecked = false;

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
                const CustomBackButton(title: 'Laporan Penyuapan'),
                FirstSection(
                  namaController: namaController,
                  jabatanController: jabatanController,
                  instansiController: instansiController,
                  size: size,
                ),
                SecondSection(
                  size: size,
                  kasusController: kasusController,
                  lokasiController: lokasiController,
                  kronologiController: kronologiController,
                  nilaiController: nilaiController,
                  tanggalController: tanggalController,
                ),
                Agreement(
                  size: size,
                  onChanged: (value) => setState(() => _isChecked = value),
                ),
                AddPenyuapanConsumer(size: size),
                Text(namaController.text),
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                      return ElevatedButton(
                        onPressed: _isChecked
                            ? () {
                                if (formFieldKey.currentState!.validate()) {
                                  BlocProvider.of<LaporanBloc>(context).add(AddLaporanPenyuapan({
                                    "nama_terlapor": namaController.text,
                                    "jabatan": jabatanController.text,
                                    "instansi": instansiController.text,
                                    "id_pelapor": state.user!.id,
                                    "nama_pelapor": state.user!.name,
                                    "kasus_suap": kasusController.text,
                                    "nilai_suap": nilaiController.text,
                                    "lokasi": lokasiController.text,
                                    "tanggal_kejadian": tanggalController.text,
                                    "kronologis_kejadian": kronologiController.text,
                                  }));
                                }
                              }
                            : null,
                        child: const Text("Kirim"),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
