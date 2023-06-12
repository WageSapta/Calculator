import 'package:calculator/apps/view/apps_view.dart';
import 'package:calculator/calculus/view/calculus_view.dart';
import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List<Widget> pages = [
    const CalculusView(),
    const AppsView(),
  ];

  PageController get pageController => _pageController;
  int get currentPage => _currentPage;

  set currentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageSelected(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
