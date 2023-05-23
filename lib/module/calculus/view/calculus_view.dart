// ignore_for_file: invalid_use_of_protected_member

import 'package:calculator/module/calculus/widget/containerCostum.dart';
import 'package:calculator/module/calculus/widget/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:calculator/core.dart';

class CalculusView extends StatefulWidget {
  const CalculusView({Key? key}) : super(key: key);

  Widget build(context, CalculusController controller) {
    controller.view = this;

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      controller.isDark = !controller.isDark;
                      controller.setState(() {});
                    },
                    icon: Icon(controller.isDark
                        ? Icons.light_mode
                        : Icons.dark_mode)),
                IconButton(
                    onPressed: () => Get.to(const CurrencyView()),
                    icon: const Icon(Icons.currency_exchange))
              ],
            ),
          ),
          Expanded(
            child: ContainerCostum(
              height: 170,
              width: Get.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    controller.input,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    controller.result,
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemCount: controller.buttons.length,
              padding: const EdgeInsets.all(30.0),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                switch (index) {
                  // clear
                  case 0:
                    return MyButton(
                      buttontapped: () {
                        controller.input = '';
                        controller.result = '0';
                        controller.setState(() {});
                      },
                      buttonText: controller.buttons[index],
                    );
                  // +/-
                  case 1:
                    return MyButton(
                      buttonText: controller.buttons[index],
                      buttontapped: () {},
                    );
                  // modulus
                  case 2:
                    return MyButton(
                      buttontapped: () {
                        controller.input += controller.buttons[index];
                        controller.setState(() {});
                      },
                      buttonText: controller.buttons[index],
                    );
                  // Delete
                  case 3:
                    return MyButton(
                      buttontapped: () {
                        if (controller.input.isNotEmpty) {
                          controller.input = controller.input
                              .substring(0, controller.input.length - 1);
                          controller.setState(() {});
                        }
                      },
                      buttonText: controller.buttons[index],
                    );
                  // equal
                  case 18:
                    return MyButton(
                      buttontapped: () {
                        controller.equalPressed();
                        controller.setState(() {});
                      },
                      buttonText: controller.buttons[index],
                    );

                  default:
                    return MyButton(
                      
                      buttontapped: () {
                        controller.input += controller.buttons[index];
                        controller.setState(() {});
                      },
                      buttonText: controller.buttons[index],
                    );
                }
              },
            ),
          )
        ],
      ),
    ));
  }

  @override
  State<CalculusView> createState() => CalculusController();
}
