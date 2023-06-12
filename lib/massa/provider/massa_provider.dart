import 'package:flutter/material.dart';

class MassaProvider extends ChangeNotifier {
  final List<String> units = ['Gram', 'Kilogram', 'Pound', 'Ounce'];
  String selectedUnit = "Gram";
  double inputMass = 0;
  double convertedMass = 0;

  void convertMass(String selectedUnit) {
    switch (selectedUnit) {
      case 'Gram':
        convertedMass = inputMass;
        break;
      case 'Kilogram':
        convertedMass = inputMass * 1000;
        break;
      case 'Pound':
        convertedMass = inputMass * 453.592;
        break;
      case 'Ounce':
        convertedMass = inputMass * 28.3495;
        break;
    }
  }
}
