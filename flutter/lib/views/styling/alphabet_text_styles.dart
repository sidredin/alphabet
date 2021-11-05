import 'package:alphabet/views/styling/alphabet_colors.dart';
import 'package:flutter/material.dart';

class AlphabetTextStyles {
  static const TextStyle labelTextStyle = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const TextStyle mainLetterTextStyle = TextStyle(
    fontSize: 100,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle authErrorTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AlphabetColors.authError,
  );
}
