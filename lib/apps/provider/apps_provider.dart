import 'package:calculator/apps/widgets/bmi/view/bmi_view.dart';
import 'package:calculator/apps/widgets/massa/view/massa_view.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppsProvider extends ChangeNotifier {
  final List apps = [
    // {'name': "Area", 'icon': Icons.open_in_full},
    {
      'name': "Bmi",
      'icon': Icons.monitor_weight_outlined,
      'widget': const BmiView()
    },
    // {'name': "Diskon", 'icon': Icons.discount_outlined},
    // {'name': "Kecepatan", 'icon': Icons.speed},
    {'name': "Massa", 'icon': MdiIcons.weight, 'widget': const MassaView()},
    // {'name': "Mata uang", 'icon': Icons.currency_exchange},
    // {'name': "Panjang", 'icon': Icons.straighten},
    // {'name': "Suhu", 'icon': Icons.thermostat},
    // {'name': "Volume", 'icon': MdiIcons.cubeOutline},
    // {'name': "Waktu", 'icon': Icons.schedule},
  ];
}
