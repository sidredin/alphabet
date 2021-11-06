import 'package:alphabet/services.dart';
import 'package:alphabet/views/screens/alphabet_screen.dart';
import 'package:alphabet/views/styling/alphabet_colors.dart';
import 'package:flutter/material.dart';

class LetterButton extends StatefulWidget {
  final String letter;
  final String mainLetter;
  final int userId;
  final VoidCallback changeMainLetterBlockColor;

  const LetterButton({
    Key? key,
    required this.letter,
    required this.mainLetter,
    required this.userId,
    required this.changeMainLetterBlockColor,
  }) : super(key: key);

  @override
  State<LetterButton> createState() => _LetterButtonState();
}

class _LetterButtonState extends State<LetterButton> {
  Color backgroundColor = AlphabetColors.lightGrey;
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color?>(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      onPressed: () {
        if (widget.letter == widget.mainLetter) {
          reactOnBtnClick(
            context,
            result: 'win',
            backgroundColor: AlphabetColors.rightChoice,
          );
          widget.changeMainLetterBlockColor();
        } else {
          reactOnBtnClick(
            context,
            result: 'loss',
            backgroundColor: AlphabetColors.incorrectChoice,
            color: Colors.white,
          );
        }
      },
      child: Text(
        widget.letter,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.normal,
          fontSize: 50,
        ),
      ),
    );
  }

  reactOnBtnClick(BuildContext context,
      {result, backgroundColor, color}) async {
    setState(() {
      this.backgroundColor = backgroundColor;
      if (color != null) {
        this.color = color;
      }
    });
    await Services().addResult(widget.userId, result);
    return Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(
        context,
        AlphabetScreen.routeName,
        arguments: {'userId': widget.userId},
      ),
    );
  }
}
