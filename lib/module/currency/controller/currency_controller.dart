import 'package:flutter/material.dart';
import 'package:calculator/state_util.dart';
import '../view/currency_view.dart';

class CurrencyController extends State<CurrencyView> implements MvcController {
  static late CurrencyController instance;
  late CurrencyView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}