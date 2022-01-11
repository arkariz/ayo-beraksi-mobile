import 'package:ayo_beraksi_flutter/common/launch/launch_screen.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/pengaduan/pengaduan_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/penyuapan/laporan_bloc.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/name_bloc/name_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/phone_bloc/phone_bloc.dart';
import 'package:ayo_beraksi_flutter/features/register/presentation/bloc/register_bloc.dart';
import 'package:ayo_beraksi_flutter/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (BuildContext context) => injector()),
        BlocProvider<RegisterBloc>(create: (BuildContext context) => injector()),
        BlocProvider<LaporanBloc>(create: (BuildContext context) => injector()),
        BlocProvider<NameBloc>(create: (BuildContext context) => injector()),
        BlocProvider<PhoneBloc>(create: (BuildContext context) => injector()),
        BlocProvider<PengaduanBloc>(create: (BuildContext context) => injector())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ayo BerAksi',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
            scaffoldBackgroundColor: kBackgroundColor,
            colorScheme: const ColorScheme.light().copyWith(primary: kPrimaryColor),
            textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const LaunchScreen(),
      ),
    );
  }
}
