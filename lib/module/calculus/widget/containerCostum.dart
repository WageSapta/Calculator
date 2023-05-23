import 'package:flutter/material.dart';

import '../../../color.dart';

class ContainerCostum extends StatelessWidget {
  final bool isMin;
  final double height;
  final double width;
  final Widget child;
  final double radius;
  const ContainerCostum({
    super.key,
    this.isMin = false,
    this.height = 0,
    this.width = 0,
    required this.child,
    this.radius = 30
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      alignment: Alignment.bottomRight,
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: MyColors.primaryColor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: const [
            BoxShadow(
              color: MyColors.greyColor,
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(-5, -5),
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(5, 5),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: child,
      ),
    );
  }
}
