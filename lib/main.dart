import 'package:ayo_beraksi_flutter/constants.dart';
import 'package:ayo_beraksi_flutter/screens/launch/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ayo BerAksi',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
          scaffoldBackgroundColor: kBackgroundColor,
          colorScheme: const ColorScheme.light().copyWith(primary: kPrimaryColor),
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const LaunchScreen(),
    );
  }
}
