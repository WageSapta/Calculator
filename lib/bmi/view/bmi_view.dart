import 'package:calculator/bmi/provider/bmi_provider.dart';
import 'package:calculator/calculus/provider/theme_provider.dart';
import 'package:calculator/utils/color.dart';
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
        TextField(
          controller: provider.heightController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Height (cm)',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isDark ? MyColors.primary : MyColors.deepGrey),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        TextField(
          controller: provider.weightController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Weight (kg)',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isDark ? MyColors.primary : MyColors.deepGrey),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
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
