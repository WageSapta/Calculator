import 'package:calculator/apps/provider/apps_provider.dart';
import 'package:calculator/apps/widgets/bmi/provider/bmi_provider.dart';
import 'package:calculator/calculus/provider/theme_provider.dart';
import 'package:calculator/apps/widgets/massa/provider/massa_provider.dart';
import 'package:calculator/nav/provider/navigation_provider.dart';
import 'package:calculator/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:calculator/utils/state_utils.dart';
import 'package:flutter/material.dart';
import 'calculus/provider/calculus_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CalculusProvider()),
        ChangeNotifierProvider(create: (_) => AppsProvider()),
        ChangeNotifierProvider(create: (_) => BmiProvider()),
        ChangeNotifierProvider(create: (_) => MassaProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            scrollBehavior: MyBehavior(),
            debugShowCheckedModeBanner: false,
            title: 'Calculator',
            navigatorKey: Get.navigatorKey,
            theme: value.currentTheme,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }

  Color? getScrollColor(BuildContext context) {
    return null;
  }
}
