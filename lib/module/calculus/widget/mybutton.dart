import 'package:flutter/material.dart';
import 'package:calculator/color.dart';

// creating Stateless Widget for buttons
class MyButton extends StatelessWidget {
  // declaring variables
  final Color color;
  final Color textColor;
  final String buttonText;
  final Function()? buttontapped;

  //Constructor
  const MyButton({
    Key? key,
    this.color = MyColors.primaryColor,
    this.textColor = MyColors.subPrimaryColor,
    required this.buttonText,
    this.buttontapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: buttontapped,
    child: Container(
      decoration: BoxDecoration(
          color: MyColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: MyColors.greyColor.withOpacity(.5),
              blurRadius: 5,
              offset: const Offset(-4, -4),
            ),
            const BoxShadow(
              color: Colors.white,
              blurRadius: 5,
              offset: Offset(4, 4),
            ),
          ]),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
      );
  }
}
