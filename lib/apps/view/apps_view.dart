import 'package:calculator/apps/provider/apps_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../calculus/provider/theme_provider.dart';
import '../../utils/color.dart';

class AppsView extends StatefulWidget {
  const AppsView({super.key});

  @override
  State<AppsView> createState() => _AppsViewState();
}

class _AppsViewState extends State<AppsView> {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<AppsProvider>();
    var isDarkMode = context.watch<ThemeProvider>().isDarkMode;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: provider.apps.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 100,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            // childAspectRatio: 2 / 1,
          ),
          itemBuilder: (BuildContext context, int index) {
            var item = provider.apps[index];
            return GestureDetector(
              onTap: () => showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor:
                    isDarkMode ? MyColors.deepGrey : MyColors.primary,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                context: context,
                builder: (_) => Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(_).viewInsets.bottom,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 80,
                        height: 5,
                        decoration: ShapeDecoration(
                          color:
                              isDarkMode ? MyColors.primary : MyColors.deepGrey,
                          shape: const StadiumBorder(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: item['widget'],
                      )
                    ],
                  ),
                ),
              ),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      item['icon'],
                      size: 25,
                      color: isDarkMode ? MyColors.primary : Colors.grey[900],
                    ),
                    Text(
                      item['name'],
                      maxLines: 2,
                      style: TextStyle(
                        color: isDarkMode ? MyColors.primary : Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
