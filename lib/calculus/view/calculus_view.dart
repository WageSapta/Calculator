import 'package:calculator/calculus/widget/text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/color.dart';
import '../../utils/state_utils.dart';
import '../provider/calculus_provider.dart';
import '../provider/theme_provider.dart';
import '../widget/mybutton.dart';
import '../widget/text_result.dart';

class CalculusView extends StatefulWidget {
  const CalculusView({super.key});

  @override
  State<CalculusView> createState() => _CalculusViewState();
}

class _CalculusViewState extends State<CalculusView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CalculusProvider>(context, listen: false).getHistory();
    });
  }

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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: calculus.history.map(
                                  (e) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const SizedBox(height: 15),
                                        Text(
                                          e['input'],
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: theme.isDarkMode
                                                ? Colors.white38
                                                : Colors.black38,
                                          ),
                                        ),
                                        Text(
                                          "= ${e['result']}",
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: theme.isDarkMode
                                                ? Colors.white38
                                                : Colors.black38,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ).toList()),
                          ),
                          SizedBox(
                            width: constraints.maxWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Visibility(
                                  visible: calculus.history.isNotEmpty,
                                  child: const Divider(height: 25),
                                ),
                                Visibility(
                                  visible: calculus.isTyping ||
                                      calculus.input != "0",
                                  child: const TextInput(),
                                ),
                                const TextResult(),
                                const SizedBox(height: 10),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
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
                      buttonText:
                          calculus.input == "0" && calculus.history.isNotEmpty
                              ? "AC"
                              : calculus.buttons[index],
                      onTap: () {
                        if (calculus.input == "0" &&
                            calculus.history.isNotEmpty) {
                          calculus.clearHistory();
                          calculus.isResult = false;
                        }
                        calculus.clear();
                      },
                    );
                  // delete
                  case 'del':
                    return MyButton(
                      theme: theme,
                      index: index,
                      fontSize: Get.width * 0.06,
                      buttonText: calculus.buttons[index],
                      onTap: () {
                        if (!calculus.isResult) {
                          calculus.delete();
                        }
                        calculus.equal();
                      },
                    );
                  // result
                  case '=':
                    return MyButton(
                      theme: theme,
                      bg: Colors.amber[900],
                      textColor:
                          theme.isDarkMode ? MyColors.primary : Colors.black,
                      index: index,
                      fontSize: Get.width * 0.06,
                      buttonText: calculus.buttons[index],
                      onTap: () {
                        calculus.isTyping = false;
                        // calculus.equal();
                        calculus.isResult = true;
                        calculus.saveHistory();
                      },
                    );
                  default:
                    // number and operator
                    return MyButton(
                      theme: theme,
                      index: index,
                      fontSize: Get.width * 0.06,
                      buttonText: calculus.buttons[index],
                      onTap: () {
                        if (calculus.isResult) {
                          calculus.getHistory();
                          calculus.clear();
                          calculus.isResult = false;
                        }
                        calculus.input = calculus.buttons[index];
                        calculus.equal();
                      },
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
