import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../apps/view/apps_view.dart';
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
    var provider = context.watch<CalculusProvider>();
    var theme = context.watch<ThemeProvider>();
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    isIcon: true,
                    padding: EdgeInsets.all(Get.width * 0.05),
                    iconSize: Get.width * 0.07,
                    onTap: () => theme.toggleTheme(),
                    icon: theme.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  ),
                  MyButton(
                    isIcon: true,
                    padding: EdgeInsets.all(Get.width * 0.05),
                    iconSize: Get.width * 0.07,
                    onTap: () => Get.to(const AppsView()),
                    icon: Icons.apps_rounded,
                  )
                ],
              ),
            ),
            Flexible(
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.all(15.0),
                // alignment: Alignment.bottomRight,
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
                        blurRadius: 15,
                        spreadRadius: 1,
                        offset: const Offset(4, 4),
                      ),
                      BoxShadow(
                        color: theme.isDarkMode
                            ? Colors.grey.shade800
                            : Colors.white,
                        blurRadius: 15,
                        spreadRadius: 1,
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
                        provider.input == "0" && provider.input.length == 1
                            ? " "
                            : provider.input,
                        maxLines: 2,
                        style: TextStyle(
                          color: theme.isDarkMode
                              ? provider.isTyping
                                  ? Colors.white
                                  : Colors.white38
                              : provider.isTyping
                                  ? Colors.black
                                  : Colors.black38,
                          fontSize: provider.isTyping ? 40 : 20,
                        ),
                      ),
                    ),
                    Text(
                      provider.result != "0"
                          ? "=${provider.result}"
                          : provider.result,
                      style: TextStyle(
                        color: theme.isDarkMode
                            ? provider.isTyping
                                ? Colors.white38
                                : Colors.white
                            : provider.isTyping
                                ? Colors.black38
                                : Colors.black,
                        fontSize: provider.isTyping ? 30 : 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: provider.buttons.length,
              padding: const EdgeInsets.all(20.0),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 15,
                childAspectRatio: 1,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (BuildContext context, int index) {
                switch (provider.buttons[index]) {
                  // clear
                  case 'C':
                    return MyButton(
                      index: index,
                      fontSize: Get.width * 0.06,
                      buttonText: provider.buttons[index],
                      onTap: () => provider.clear(),
                    );
                  // delete
                  case 'del':
                    return MyButton(
                      index: index,
                      fontSize: Get.width * 0.06,
                      buttonText: provider.buttons[index],
                      onTap: () => provider.delete(),
                    );
                  // result
                  case '=':
                    return MyButton(
                      bg: theme.isDarkMode
                          ? MyColors.primary
                          : Colors.grey[900],
                      textColor:
                          theme.isDarkMode ? Colors.black : MyColors.primary,
                      index: index,
                      fontSize: Get.width * 0.06,
                      buttonText: provider.buttons[index],
                      onTap: () => provider.equal(),
                    );
                  default:
                    return MyButton(
                      index: index,
                      fontSize: Get.width * 0.06,
                      buttonText: provider.buttons[index],
                      onTap: () => provider.input = provider.buttons[index],
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
