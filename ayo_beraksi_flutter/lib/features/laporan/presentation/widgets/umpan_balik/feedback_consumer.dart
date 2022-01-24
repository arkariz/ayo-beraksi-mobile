import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/feedback/feedback_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedbackConsumer extends StatelessWidget {
  const FeedbackConsumer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<FeedbackBloc>(context),
      builder: (context, FeedbackState state) {
        if (state is FeedbackSuccess) {
          return const Text("success");
        }
        if (state is FeedbackFailed) {
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
      listener: (BuildContext context, FeedbackState state) {},
    );
  }
}
