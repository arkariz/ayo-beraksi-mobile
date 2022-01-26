import 'dart:io';
import 'dart:isolate';

import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/core/params/notification_params.dart';
import 'package:ayo_beraksi_flutter/core/widgets/launch_screen.dart';
import 'package:ayo_beraksi_flutter/core/widgets/splash_screen.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/core/resources/notification_service.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/feedback/feedback_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/gratifikasi/gratifikasi_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/laporan_list/laporan_list_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/pengaduan/pengaduan_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/penyuapan/laporan_bloc.dart';
import 'package:ayo_beraksi_flutter/features/login/data/models/user_hive_model.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/models/notification_model.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/notification.dart' as ne;
import 'package:ayo_beraksi_flutter/features/notification/presentation/bloc/fcm/fcm_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/name_bloc/name_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/phone_bloc/phone_bloc.dart';
import 'package:ayo_beraksi_flutter/features/register/presentation/bloc/register_bloc.dart';
import 'package:ayo_beraksi_flutter/features/search/presentation/bloc/search_bloc.dart';
import 'package:ayo_beraksi_flutter/injector.dart';
import 'package:ayo_beraksi_flutter/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/notification/presentation/bloc/notification/notification_bloc.dart';

// Future<void> _saveNotification(RemoteNotification notification, String path) async {
//   var remoteNotification = NotificationModel(
//     notification.hashCode,
//     notification.title!,
//     notification.body!,
//   );

//   Hive.init(path);
//   Hive.registerAdapter<NotificationModel>(NotificationModelAdapter());
//   var box = await Hive.openBox<NotificationModel>(CACHED_NOTIFICATION);
//   box.add(remoteNotification);
//   box.close();
// }

Future<void> _messageHandler(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null) {
    NotificationService().showNotification(
      notification.hashCode,
      notification.title!,
      notification.body!,
      2,
      'high_importance_channel', // id
      'High Importance Notifications',
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(CACHED_NOTIF_ID, notification.hashCode);
    await prefs.setString(CACHED_NOTIF_TITLE, notification.title!);
    await prefs.setString(CACHED_NOTIF_BODY, notification.body!);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter<HiveUser>(HiveUserAdapter());
  Hive.registerAdapter<NotificationModel>(NotificationModelAdapter());

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (BuildContext context) => injector()),
        BlocProvider<RegisterBloc>(create: (BuildContext context) => injector()),
        BlocProvider<LaporanBloc>(create: (BuildContext context) => injector()),
        BlocProvider<NameBloc>(create: (BuildContext context) => injector()),
        BlocProvider<PhoneBloc>(create: (BuildContext context) => injector()),
        BlocProvider<PengaduanBloc>(create: (BuildContext context) => injector()),
        BlocProvider<GratifikasiBloc>(create: (BuildContext context) => injector()),
        BlocProvider<NotificationBloc>(create: (BuildContext context) => injector()),
        BlocProvider<FcmBloc>(create: (BuildContext context) => injector()),
        BlocProvider<FeedbackBloc>(create: (BuildContext context) => injector()),
        BlocProvider<LaporanListBloc>(create: (BuildContext context) => injector()),
        BlocProvider<SearchBloc>(create: (BuildContext context) => injector())
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
        home: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          BlocProvider.of<LoginBloc>(context).add(CheckUserLogin());

          if (state is LoginDone) {
            return const HomeScreen();
          }
          if (state is LoginLoading) {
            return const SplashScreen();
          }
          if (state is LoginInit) {
            return const LaunchScreen();
          }
          if (state is LoggedOut) {
            return const LaunchScreen();
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
