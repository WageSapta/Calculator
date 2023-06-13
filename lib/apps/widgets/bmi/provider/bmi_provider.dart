import 'package:flutter/material.dart';

class BmiProvider extends ChangeNotifier {
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  double _bmiResult = 0.0;
   String _resultText = "";

  double get bmiResult => _bmiResult;
  String get resultText => _resultText;

  @override
  void dispose() {
    _bmiResult = 0.0;
    _resultText = "";
    super.dispose();
  }

  void calculateBMI() {
    double? height = double.tryParse(heightController.text);
    double? weight = double.tryParse(weightController.text);

    if (height != null && weight != null) {
      double bmi = weight / ((height / 100) * (height / 100));
      _bmiResult = bmi;
      _resultText = "- ${interpretBMI(bmi)}";
    }
    notifyListeners();
  }

  String interpretBMI(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
