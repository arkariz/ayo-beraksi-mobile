import 'package:ayo_beraksi_flutter/common/launch/launch_screen.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/laporan_bloc.dart';
import 'package:ayo_beraksi_flutter/features/register/presentation/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPenyuapanConsumer extends StatelessWidget {
  const AddPenyuapanConsumer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<LaporanBloc>(context),
      builder: (context, LaporanState state) {
        if (state is LaporanPenyuapanSuccess) {
          return const Text("success");
        }
        if (state is LaporanPenyuapanFailed) {
          return SizedBox(
              width: size.width,
              child: Center(
                  child: Text(
                state.error!.message,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).errorColor),
              )));
        }
        return const SizedBox();
      },
      listener: (BuildContext context, LaporanState state) {
        // if (state is LaporanPenyuapanSuccess) {
        //   Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(builder: (context) => const LaunchScreen()),
        //   );
        // }
      },
    );
  }
}
