import 'package:calculator/calculus/provider/theme_provider.dart';
import 'package:calculator/calculus/widget/mybutton.dart';
import 'package:calculator/nav/provider/navigation_provider.dart';
import 'package:calculator/utils/state_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:provider/provider.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => NavigationViewState();
}

class NavigationViewState extends State<NavigationView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer2<ThemeProvider, NavigationProvider>(
          builder: (context, theme, nav, child) {
            return Column(
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
                        theme: theme,
                        isIcon: true,
                        padding: EdgeInsets.all(Get.width * 0.05),
                        iconSize: Get.width * 0.05,
                        onTap: () => theme.toggleTheme(),
                        icon: theme.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                      nav.currentPage == 0
                          ? Padding(
                              padding: EdgeInsets.all(Get.width * 0.05),
                              child: Icon(
                                Icons.calculate,
                                size: Get.width * 0.05,
                              ),
                            )
                          : MyButton(
                              theme: theme,
                              isFlat: nav.currentPage == 0 ? true : false,
                              isIcon: true,
                              padding: EdgeInsets.all(Get.width * 0.05),
                              iconSize: Get.width * 0.05,
                              onTap: () {
                                nav.pageController.animateToPage(
                                  0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              icon: Icons.calculate,
                            ),
                      nav.currentPage == 1
                          ? Padding(
                              padding: EdgeInsets.all(Get.width * 0.05),
                              child: Icon(
                                Icons.widgets_rounded,
                                size: Get.width * 0.05,
                              ),
                            )
                          : MyButton(
                              theme: theme,
                              isFlat: nav.currentPage == 1 ? true : false,
                              isIcon: true,
                              padding: EdgeInsets.all(Get.width * 0.05),
                              iconSize: Get.width * 0.05,
                              onTap: () {
                                nav.pageController.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              icon: Icons.widgets_rounded,
                            )
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: nav.pageController,
                    onPageChanged: (i) => nav.currentPage = i,
                    children: nav.pages,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
