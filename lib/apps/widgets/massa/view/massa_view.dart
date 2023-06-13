import 'package:calculator/apps/widgets/massa/provider/massa_provider.dart';
import 'package:calculator/apps/widgets/text_field.dart';
import 'package:calculator/calculus/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MassaView extends StatefulWidget {
  const MassaView({super.key});

  @override
  State<MassaView> createState() => _MassaViewState();
}

class _MassaViewState extends State<MassaView> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, MassaProvider>(
      builder: (context, theme, massa, child) {
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: MyTextField(
                    isDark: theme.isDarkMode,
                    hintText: 'Input Values',
                    onChanged: (value) {
                      massa.input1Value = double.tryParse(value) ?? 0.0;
                      massa.convertValue();
                    },
                  ),
                ),
                const SizedBox(width: 20.0),
                Flexible(
                  child: DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(20),
                    value: massa.selectedFromMassUnit,
                    onChanged: (newValue) {
                      massa.selectedFromMassUnit = newValue!;
                      massa.convertValue();
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber.shade900),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    items: massa.conversionRates.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: MyTextField(
                    isDark: theme.isDarkMode,
                    hintText: 'Result',
                    controller: TextEditingController(
                        text: massa.input2Value.toStringAsFixed(2)),
                  ),
                ),
                const SizedBox(width: 20.0),
                Flexible(
                  child: DropdownButtonFormField<String>(
                    value: massa.selectedToMassUnit,
                    borderRadius: BorderRadius.circular(20),
                    onChanged: (newValue) {
                      massa.selectedToMassUnit = newValue!;
                      massa.convertValue();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.amber.shade900)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber.shade900),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    items: massa.conversionRates.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
