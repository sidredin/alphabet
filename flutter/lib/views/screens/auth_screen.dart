import 'package:alphabet/views/styling/alphabet_decorations.dart';
import 'package:alphabet/views/widgets/alphabet_button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const String routeName = 'registration';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _name,
                autocorrect: false,
                enableSuggestions: false,
                decoration: AlphabetDecorations.textFieldInputDecoration,
              ),
              const SizedBox(height: 14),
              TextFormField(
                obscureText: true,
                controller: _password,
                autocorrect: false,
                enableSuggestions: false,
                decoration: AlphabetDecorations.textFieldInputDecoration
                    .copyWith(labelText: 'Пароль'),
              ),
              const SizedBox(height: 14),
              AlphabetButton(
                text: 'Авторизация',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
