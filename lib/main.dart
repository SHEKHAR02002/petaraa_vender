import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/screen/login_screens/login.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              surfaceTintColor: Colors.transparent,
              backgroundColor: white,
              foregroundColor: primaryColor,
              elevation: 0,
              centerTitle: true),
          fontFamily: "Overpass",
          scaffoldBackgroundColor: white,
          primaryColor: primaryColor,
          secondaryHeaderColor: primary2Color,
          primarySwatch: Colors.indigo),
      home: const LoginScreen(),
    );
  }
}
