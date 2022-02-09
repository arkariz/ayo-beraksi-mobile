import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/pengaduan/pengaduan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PengaduanConsumer extends StatelessWidget {
  const PengaduanConsumer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<PengaduanBloc>(context),
      builder: (context, PengaduanState state) {
        // if (state is PengaduanSuccess) {
        //   return Text(state.pengaduan!.message);
        // }
        if (state is PengaduanFailed) {
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
      listener: (BuildContext context, PengaduanState state) {},
    );
  }
}
