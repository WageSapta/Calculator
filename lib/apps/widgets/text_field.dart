import 'package:flutter/material.dart';

import '../../utils/color.dart';

class MyTextField extends StatefulWidget {
  final bool isDark;
  final TextEditingController? controller;
  final String hintText;
  final Function(String)? onChanged;
  final bool readOnly;
  const MyTextField(
      {super.key,
      this.isDark = false,
      this.controller,
      required this.hintText,
      this.onChanged,
      this.readOnly = false});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      readOnly: widget.readOnly,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.isDark ? MyColors.primary : MyColors.deepGrey),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
