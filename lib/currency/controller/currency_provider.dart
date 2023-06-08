import 'package:flutter/material.dart';

class CurrencyProvider extends ChangeNotifier {
  String _currency = 'USD';
  String get currency => _currency;
  void setCurrency(String currency) {
    _currency = currency;
    notifyListeners();
  }

  
}
