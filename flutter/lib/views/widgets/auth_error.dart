import 'package:alphabet/views/styling/alphabet_text_styles.dart';
import 'package:flutter/material.dart';

class AuthError extends StatelessWidget {
  const AuthError({
    Key? key,
    required this.errorText,
  }) : super(key: key);

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          errorText,
          style: AlphabetTextStyles.authErrorTextStyle,
        ),
        const SizedBox(height: 13),
      ],
    );
  }
}
