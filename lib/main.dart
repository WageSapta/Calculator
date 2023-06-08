import 'package:calculator/calculus/provider/theme_provider.dart';
import 'package:calculator/currency/controller/currency_provider.dart';
import 'package:provider/provider.dart';
import 'package:calculator/utils/state_utils.dart';
import 'package:flutter/material.dart';
import 'calculus/provider/calculus_provider.dart';
import 'calculus/view/calculus_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CalculusProvider()),
        ChangeNotifierProvider(create: (_) => CurrencyProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Calculator',
            navigatorKey: Get.navigatorKey,
            theme: value.currentTheme,
            home: const CalculusView(),
          );
        },
      ),
    );
  }
}
