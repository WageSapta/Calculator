import 'package:calculator/calculus/provider/calculus_provider.dart';
import 'package:calculator/calculus/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextResult extends StatelessWidget {
  const TextResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = context.watch<ThemeProvider>();
    var calculus = context.watch<CalculusProvider>();
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        calculus.isTyping || calculus.result != "0"
            ? "= ${calculus.result}"
            : calculus.result,
        maxLines: 1,
        style: TextStyle(
          fontSize: calculus.isTyping ? 30 : 45,
          // fontWeight: FontWeight.bold,
          color: theme.isDarkMode
              ? calculus.isTyping
                  ? Colors.white70
                  : Colors.white
              : calculus.isTyping
                  ? Colors.black87
                  : Colors.black,
        ),
      ),
    );
  }
}
