import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../../utils/shared_history.dart';

class CalculusProvider extends ChangeNotifier {


  bool _isTyping = false;
  bool _isResult = false;
  String _input = "0";
  String _result = "0";
  final List _history = [];
  final List numeric = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
  ];
  final List operators = [
    "+",
    "-",
    "×",
    "÷",
    "%",
    "^",
    ".",
  ];
  final List<String> _buttons = [
    'C',
    'del',
    '%',
    '÷',
    '7',
    '8',
    '9',
    '×',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '^',
    '0',
    '.',
    '=',
  ];

  bool get isTyping => _isTyping;
  bool get isResult => _isResult;
  String get input => _input;
  String get result => _result;
  List<String> get buttons => _buttons;
  List get history => _history;

  set isTyping(bool val) {
    _isTyping = val;
    notifyListeners();
  }

  set input(String val) {
    if (numeric.contains(val) && _input == "0") {
      if (val != "0") {
        _isTyping = true;
        _input = val;
      }
    } else {
      if (_input.length < 15) {
        _isTyping = true;
        if (operators
                .contains(_input.substring(_input.length - 1, _input.length)) &&
            operators.contains(val)) {
          _input = _input.substring(0, _input.length - 1) + val;
        } else {
          _input += val;
        }
      }
    }

    notifyListeners();
  }

  set isResult(bool val) {
    _isResult = val;
    notifyListeners();
  }

  void clear() {
    _input = '0';
    _result = '0';
    _isTyping = false;
    notifyListeners();
  }

  void delete() {
    if (_input != "0") {
      if (_input.length == 1 ||
          (_input.substring(0, _input.length - (_input.length - 1)) == "0" &&
              _input.length == 2)) {
        clear();
      } else {
        _isTyping = true;
        _input = _input.substring(0, _input.length - 1);
      }
    }
    notifyListeners();
  }

  void equal() {
    String finaluserinput = _input;
    finaluserinput = finaluserinput.replaceAll('×', '*');
    finaluserinput = finaluserinput.replaceAll('÷', '/');
    finaluserinput = finaluserinput.replaceAll('^', '^');
    finaluserinput = finaluserinput.replaceAll('%', '%');
    try {
      Parser p = Parser();
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      _result = eval.toString();
      if (_result.toString().endsWith(".0")) {
        _result = int.parse(result.toString().replaceAll(".0", "")).toString();
      }
    } catch (e) {
      return;
    }
  }

  void saveHistory() async {
    var map = {"input": _input, "result": _result};
    await SharedHistory.saveMap(map);
    notifyListeners();
  }

  void getHistory() async {
    List h = await SharedHistory.getList();
    _history.clear();
    _history.addAll(h);
    _isResult = false;
    notifyListeners();
  }

  void clearHistory() async {
    _history.clear();
    await SharedHistory.clearList();
    notifyListeners();
  }
}
