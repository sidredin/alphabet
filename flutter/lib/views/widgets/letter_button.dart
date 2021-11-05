import 'package:alphabet/views/styling/alphabet_colors.dart';
import 'package:flutter/material.dart';

class LetterButton extends StatefulWidget {
  final String letter;
  final String mainLetter;

  const LetterButton({
    Key? key,
    required this.letter,
    required this.mainLetter,
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
          setState(() {
            backgroundColor = AlphabetColors.rightChoice;
          });
        } else {
          setState(() {
            backgroundColor = AlphabetColors.incorrectChoice;
            color = Colors.white;
          });
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
}
