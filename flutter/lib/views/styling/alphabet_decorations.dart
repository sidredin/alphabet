import 'package:alphabet/views/styling/alphabet_colors.dart';
import 'package:alphabet/views/styling/alphabet_text_styles.dart';
import 'package:flutter/material.dart';

class AlphabetDecorations {
  static const OutlineInputBorder textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: AlphabetColors.lightGrey),
  );

  static const Decoration contactsDecoration = BoxDecoration(
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(40),
      right: Radius.circular(40),
    ),
    color: AlphabetColors.darkGrey,
  );

  static const InputDecoration textFieldInputDecoration = InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    labelText: "Логин",
    labelStyle: TextStyle(
      fontWeight: FontWeight.normal,
    ),
    alignLabelWithHint: true,
    // hintText: 'Логин',
    hintStyle: AlphabetTextStyles.labelTextStyle,
    contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
    border: textFieldBorder,
    enabledBorder: textFieldBorder,
    disabledBorder: textFieldBorder,
  );
}
