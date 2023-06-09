import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/calculus_provider.dart';
import '../provider/theme_provider.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = context.watch<ThemeProvider>();
    var calculus = context.watch<CalculusProvider>();
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        calculus.input,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: calculus.isTyping ? 45 : 30,
          // fontWeight: FontWeight.bold,
          color: theme.isDarkMode
              ? calculus.isTyping
                  ? Colors.white
                  : Colors.white38
              : calculus.isTyping
                  ? Colors.black
                  : Colors.black38,
        ),
      ),
    );
  }
}
