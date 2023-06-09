import 'package:calculator/nav/view/navigation_view.dart';
import 'package:calculator/utils/color.dart';
import 'package:calculator/utils/state_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future loading() async {
    await Future.delayed(const Duration(seconds: 1), () {
      return Get.offAll(const NavigationView());
    });
  }

  @override
  void initState() {
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: Center(
        child: Icon(
          Icons.calculate_rounded,
          size: Get.height * 0.3,
        ),
      ),
    );
  }
}


