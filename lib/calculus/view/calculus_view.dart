import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/color.dart';
import '../../utils/state_utils.dart';
import '../provider/calculus_provider.dart';
import '../provider/theme_provider.dart';
import '../widget/mybutton.dart';

class CalculusView extends StatefulWidget {
  const CalculusView({super.key});

  @override
  State<CalculusView> createState() => _CalculusViewState();
}

class _CalculusViewState extends State<CalculusView> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, CalculusProvider>(
      builder: (context, theme, calculus, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.all(20.0),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color:
                        theme.isDarkMode ? Colors.grey[900] : MyColors.primary,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: theme.isDarkMode
                            ? Colors.black
                            : Colors.grey.shade500,
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(5, 5),
                      ),
                      BoxShadow(
                        color: theme.isDarkMode
                            ? Colors.grey.shade800
                            : MyColors.primary,
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(-4, -4),
                      ),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        calculus.input == "0" && calculus.input.length == 1
                            ? " "
                            : calculus.input,
                        maxLines: 2,
                        style: TextStyle(
                          color: theme.isDarkMode
                              ? calculus.isTyping
                                  ? Colors.white
                                  : Colors.white38
                              : calculus.isTyping
                                  ? Colors.black
                                  : Colors.black38,
                          fontSize: calculus.isTyping ? 50 : 40,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        calculus.result != "0"
                            ? "=${calculus.result}"
                            : calculus.result,
                        maxLines: 1,
                        style: TextStyle(
                          color: theme.isDarkMode
                              ? calculus.isTyping
                                  ? Colors.white38
                                  : Colors.white
                              : calculus.isTyping
                                  ? Colors.black38
                                  : Colors.black,
                          fontSize: calculus.isTyping ? 40 : 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: calculus.buttons.length,
              padding: const EdgeInsets.all(20.0),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 15,
                childAspectRatio: 1,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (BuildContext context, int index) {
                switch (calculus.buttons[index]) {
                  // clear
                  case 'C':
                    return MyButton(
                      theme: theme,
                      index: index,
                      fontSize: Get.width * 0.06,
                      buttonText: calculus.buttons[index],
                      onTap: () => calculus.clear(),
                    );
                  // delete
                  case 'del':
                    return MyButton(
                      theme: theme,
                      index: index,
                      fontSize: Get.width * 0.06,
                      buttonText: calculus.buttons[index],
                      onTap: () => calculus.delete(),
                    );
                  // result
                  case '=':
                    return MyButton(
                      theme: theme,
                      bg: theme.isDarkMode
                          ? MyColors.primary
                          : Colors.grey[900],
                      textColor:
                          theme.isDarkMode ? Colors.black : MyColors.primary,
                      index: index,
                      fontSize: Get.width * 0.06,
                      buttonText: calculus.buttons[index],
                      onTap: () => calculus.equal(),
                    );
                  default:
                    return MyButton(
                      theme: theme,
                      index: index,
                      fontSize: Get.width * 0.06,
                      buttonText: calculus.buttons[index],
                      onTap: () => calculus.input = calculus.buttons[index],
                    );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
