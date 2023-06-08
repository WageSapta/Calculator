import '../provider/theme_provider.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import 'package:provider/provider.dart';

class MyButton extends StatefulWidget {
  final String buttonText;
  final Function()? onTap;
  final int? index;
  final bool isIcon;
  final double? iconSize;
  final double? fontSize;
  final IconData? icon;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool isButton;
  final Color? textColor;
  final Color? bg;

  //Constructor
  const MyButton({
    Key? key,
    this.buttonText = "",
    this.onTap,
    this.index,
    this.isIcon = false,
    this.icon,
    this.padding,
    this.iconSize,
    this.fontSize,
    this.isButton = true,
    this.margin,
    this.bg,
    this.textColor,
  }) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  Set<int> listTap = <int>{};
  bool isPressed = false;

  void _handlePress(index) {
    setState(() {
      if (!widget.isIcon) {
        listTap.add(index);
      }
      isPressed = true;
    });
  }

  void _handleRelease(index) {
    setState(() {
      if (!widget.isIcon) {
        listTap.remove(index);
      }
      isPressed = false;
    });
  }

  Color getColor(theme) {
    Color? bg;
    if (theme.isDarkMode) {
      if (widget.bg != null) {
        bg = widget.bg!;
      } else {
        bg = Colors.grey[900]!;
      }
    } else {
      if (widget.bg != null) {
        bg = widget.bg!;
      } else {
        bg = MyColors.primary;
      }
    }
    setState(() {});
    return bg;
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.watch<ThemeProvider>();
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _handlePress(widget.index),
      onTapCancel: () => _handleRelease(widget.index),
      onTapUp: (_) => _handleRelease(widget.index),
      child: Container(
        padding: widget.padding,
        margin: widget.margin,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: getColor(theme),
          shape:
              widget.index != 18 ? const CircleBorder() : const StadiumBorder(),
          shadows: listTap.contains(widget.index) || isPressed
              ? []
              : [
                  // Bottom Rigth Shadow
                  BoxShadow(
                    offset: const Offset(4, 4),
                    color:
                        theme.isDarkMode ? Colors.black : Colors.grey.shade500,
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  // Top Left Shadow
                  BoxShadow(
                    offset: const Offset(-4, -4),
                    color:
                        theme.isDarkMode ? Colors.grey.shade800 : Colors.white,
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
        ),
        child: widget.isIcon
            ? Icon(widget.icon, size: widget.iconSize)
            : Text(
                widget.buttonText,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
