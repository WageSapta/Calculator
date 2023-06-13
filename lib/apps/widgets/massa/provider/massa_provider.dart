import 'package:flutter/material.dart';

class MassaProvider extends ChangeNotifier {
  double _input1Value = 0;
  double _input2Value = 0;
  String _selectedFromMassUnit = 'Kilogram';
  String _selectedToMassUnit = 'Gram';

  double get input1Value => _input1Value;
  double get input2Value => _input2Value;
  String get selectedFromMassUnit => _selectedFromMassUnit;
  String get selectedToMassUnit => _selectedToMassUnit;

  set input1Value(val) {
    _input1Value = val;
    notifyListeners();
  }

  set input2Value(val) {
    _input2Value = val;
    notifyListeners();
  }

  set selectedFromMassUnit(val) {
    _selectedFromMassUnit = val;
    notifyListeners();
  }

  set selectedToMassUnit(val) {
    _selectedToMassUnit = val;
    notifyListeners();
  }

  final Map<String, double> conversionRates = {
    'Kilogram': 1,
    'Gram': 1000,
    'Pound': 2.20462,
    // Add more units and conversion rates here
  };

  void convertValue() {
    double conversionRate = conversionRates[selectedToMassUnit]! /
        conversionRates[selectedFromMassUnit]!;
    _input2Value = input1Value * conversionRate;
    notifyListeners();
  }
}
