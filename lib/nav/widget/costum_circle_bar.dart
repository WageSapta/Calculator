import 'dart:math';

import 'package:flutter/material.dart';

class CircularTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final int currentIndex;
  final Function(int) onTabSelected;

  const CircularTabBar({super.key, 
    required this.tabs,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        for (int i = 0; i < tabs.length; i++)
          Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
              onTap: () => onTabSelected(i),
              child: Transform.translate(
                offset: _calculatePosition(tabs.length, i),
                child: _buildTabButton(i),
              ),
            ),
          ),
      ],
    );
  }

  Offset _calculatePosition(int totalTabs, int tabIndex) {
    double angle = (2 * 3.1416) / totalTabs;
    double radius = 80.0;
    double initialAngle = -0.5 * angle;
    double x = radius * (1.0 - 1.2 * tabIndex) * (totalTabs > 1 ? 1 : 0.5) * -1;
    double y =
        radius * (1.0 - 1.2 * tabIndex).abs() * (totalTabs > 1 ? 1 : 0.5) * -1;

    double dx = x * cos(tabIndex * angle + initialAngle) -
        y * sin(tabIndex * angle + initialAngle);
    double dy = x * sin(tabIndex * angle + initialAngle) +
        y * cos(tabIndex * angle + initialAngle);

    return Offset(dx, dy);
  }

  Widget _buildTabButton(int index) {
    return Material(
      elevation: 4,
      shape: const CircleBorder(),
      child: SizedBox(
        width: 56,
        height: 56,
        child: tabs[index],
      ),
    );
  }
}
