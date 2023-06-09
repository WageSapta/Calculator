import '../provider/theme_provider.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';

class MyButton extends StatefulWidget {
  final ThemeProvider? theme;
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
  final bool isFlat;

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
    this.isFlat = false,
    this.theme,
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
    setState(() {
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
    });
    return bg!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPressDown: (_) => _handlePress(widget.index),
      onTapCancel: () => _handleRelease(widget.index),
      onTapUp: (_) => _handleRelease(widget.index),
      // fix bug
      onVerticalDragStart: (_)=>_handleRelease(widget.index),
      onHorizontalDragStart: (_)=>_handleRelease(widget.index),
      child: Container(
        padding: widget.padding,
        margin: widget.margin,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: getColor(widget.theme),
          shape:
              widget.index != 18 ? const CircleBorder() : const StadiumBorder(),
          shadows: listTap.contains(widget.index) || isPressed || widget.isFlat
              ? []
              : [
                  // Bottom Rigth Shadow
                  BoxShadow(
                    offset: const Offset(4, 4),
                    color: widget.theme!.isDarkMode
                        ? Colors.black
                        : Colors.grey.shade500,
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                  // Top Left Shadow
                  BoxShadow(
                    offset: const Offset(-4, -4),
                    color: widget.theme!.isDarkMode
                        ? Colors.grey.shade800
                        : Colors.white,
                    blurRadius: 10,
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
