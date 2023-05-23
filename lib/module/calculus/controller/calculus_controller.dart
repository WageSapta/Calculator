import 'package:flutter/material.dart';
import 'package:calculator/state_util.dart';
import 'package:math_expressions/math_expressions.dart';
import '../view/calculus_view.dart';

class CalculusController extends State<CalculusView> implements MvcController {
  static late CalculusController instance;
  late CalculusView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  bool isPressed = false;
  bool isDark = false;

  var input = '';
  var result = '0';

  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finaluserinput = input;
    finaluserinput = input.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
