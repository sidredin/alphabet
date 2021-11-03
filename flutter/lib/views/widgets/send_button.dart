import 'package:alphabet/views/styling/alphabet_colors.dart';
import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    Key? key,
    required this.text,
    this.color = AlphabetColors.darkGrey,
    this.onPressed,
    this.height = 50,
    this.fontSize = 18.0,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.w700,
  }) : super(key: key);

  final String text;
  final Color color;
  final VoidCallback? onPressed;
  final double height;
  final double fontSize;
  final Color? textColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
            side: BorderSide(color: color),
          ),
        ),
      ),
      child: Container(
        height: height,
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
