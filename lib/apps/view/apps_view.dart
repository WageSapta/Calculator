import 'package:calculator/calculus/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppsView extends StatefulWidget {
  const AppsView({super.key});

  @override
  State<AppsView> createState() => _AppsViewState();
}

class _AppsViewState extends State<AppsView> {
  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.watch<ThemeProvider>().isDarkMode;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 100,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    // childAspectRatio: 2 / 1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    // Mengatur lebar item berdasarkan indeks
                    double itemWidth = index % 2 == 0 ? 200.0 : 100.0;

                    return Container(
                      // margin: const EdgeInsets.all(20.0),
                      // width: itemWidth,
                      decoration: ShapeDecoration(
                        color: Colors.red,
                        shape: index % 2 == 0
                            ? const StadiumBorder()
                            : const CircleBorder(),
                      ),
                      // height: 100,
                      child: const Text(
                          "sdasda"), // Ganti YourWidget dengan widget Anda sendiri
                    );
                  },
                  itemCount: 5, // Jumlah total item dalam grid
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
