import 'package:alphabet/views/styling/alphabet_colors.dart';
import 'package:flutter/material.dart';

class LetterButton extends StatelessWidget {
  final String letter;
  final Function()? onPressed;

  const LetterButton({
    Key? key,
    required this.letter,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor:
            MaterialStateProperty.all<Color?>(AlphabetColors.lightGrey),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        letter,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 50,
        ),
      ),
    );
  }
}
