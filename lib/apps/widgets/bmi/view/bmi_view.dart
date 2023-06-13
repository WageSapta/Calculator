import 'package:calculator/apps/widgets/bmi/provider/bmi_provider.dart';
import 'package:calculator/apps/widgets/text_field.dart';
import 'package:calculator/calculus/provider/theme_provider.dart';
import 'package:calculator/utils/state_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiView extends StatefulWidget {
  const BmiView({super.key});

  @override
  State<BmiView> createState() => _BmiViewState();
}

class _BmiViewState extends State<BmiView> {
  @override
  Widget build(BuildContext context) {
    var isDark = context.watch<ThemeProvider>().isDarkMode;
    var provider = context.watch<BmiProvider>();
    return Column(
      children: [
        Text(
          "Bmi: ${provider.bmiResult.toStringAsFixed(2)} ${provider.resultText}",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        MyTextField(
          isDark: isDark,
          controller: provider.heightController,
          hintText: 'Height (cm)',
        ),
        const SizedBox(height: 10.0),
        MyTextField(
          isDark: isDark,
          controller: provider.weightController,
          hintText: 'Weight (kg)',
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          height: 50,
          width: Get.width,
          child: ElevatedButton(
            style: TextButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.amber[900]),
            onPressed: () => provider.calculateBMI(),
            child: const Text('Calculate'),
          ),
        ),
      ],
    );
  }
}
