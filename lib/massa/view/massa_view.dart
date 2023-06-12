import '../../calculus/provider/theme_provider.dart';
import '../provider/massa_provider.dart';
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
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Input Mass',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                massa.inputMass = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'From',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: massa.selectedUnit,
              onChanged: (value) {
                massa.selectedUnit = value!;
              },
              items: massa.units.map((unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                massa.convertMass(massa.selectedUnit);
              },
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Converted Mass',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '${massa.convertedMass}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        );
      },
    );
  }
}
