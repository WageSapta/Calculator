import 'package:flutter/material.dart';
import 'package:calculator/core.dart';
import '../controller/currency_controller.dart';

class CurrencyView extends StatefulWidget {
  const CurrencyView({Key? key}) : super(key: key);

  Widget build(context, CurrencyController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<CurrencyView> createState() => CurrencyController();
}