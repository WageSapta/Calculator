import 'package:calculator/color.dart';
import 'package:calculator/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        scaffoldBackgroundColor: MyColors.primaryColor,
        useMaterial3: true,
      ),
      home: const CalculusView(),
    );
  }
}
