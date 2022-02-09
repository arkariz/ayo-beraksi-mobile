import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/gratifikasi/gratifikasi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GratifikasiConsumer extends StatelessWidget {
  const GratifikasiConsumer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<GratifikasiBloc>(context),
      builder: (context, GratifikasiState state) {
        // if (state is GratifikasiSuccess) {
        //   return Text(state.gratifikasi!.message);
        // }
        if (state is GratifikasiFailed) {
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
      listener: (BuildContext context, GratifikasiState state) {
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
