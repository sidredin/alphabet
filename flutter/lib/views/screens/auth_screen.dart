import 'package:alphabet/services.dart';
import 'package:alphabet/views/screens/alphabet_screen.dart';
import 'package:alphabet/views/styling/alphabet_decorations.dart';
import 'package:alphabet/views/widgets/auth_error.dart';
import 'package:alphabet/views/widgets/send_button.dart';
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
  Widget nameError = Container();
  Widget passwordError = Container();
  Widget commonError = Container();
  InputBorder? nameInputBorder = AlphabetDecorations.textFieldBorder;
  InputBorder? passwordInputBorder = AlphabetDecorations.textFieldBorder;
  Services services = Services();

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
                decoration:
                    AlphabetDecorations.textFieldInputDecoration.copyWith(
                  labelText: "Имя",
                  border: nameInputBorder,
                  enabledBorder: nameInputBorder,
                  focusedBorder: nameInputBorder,
                ),
              ),
              const SizedBox(height: 14),
              nameError,
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                controller: _password,
                autocorrect: false,
                enableSuggestions: false,
                decoration:
                    AlphabetDecorations.textFieldInputDecoration.copyWith(
                  labelText: 'Пароль',
                  border: passwordInputBorder,
                  enabledBorder: passwordInputBorder,
                  focusedBorder: passwordInputBorder,
                ),
              ),
              const SizedBox(height: 14),
              passwordError,
              commonError,
              SendButton(
                text: 'Войти',
                onPressed: () {
                  checkAuth(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkAuth(BuildContext context) async {
    String name = _name.value.text.trim();
    String password = _password.value.text.trim();
    String nameErrorText = '';
    String passwordErrorText = '';

    if (name == '') {
      nameErrorText = ' Введите имя!';
      nameError = AuthError(errorText: nameErrorText);
      nameInputBorder = AlphabetDecorations.errorTextFieldBorder;
    } else {
      if (!isCyrillic(name)) {
        nameErrorText = 'Имя должно содержать только русские буквы!';
        nameError = AuthError(errorText: nameErrorText);
        nameInputBorder = AlphabetDecorations.errorTextFieldBorder;
      } else {
        nameErrorText = '';
        nameError = Container();
        nameInputBorder = AlphabetDecorations.textFieldBorder;
      }
    }

    if (password == '') {
      passwordErrorText = 'Введите пароль!';
      passwordError = AuthError(errorText: passwordErrorText);
      passwordInputBorder = AlphabetDecorations.errorTextFieldBorder;
    } else {
      if (!isNumeric(password)) {
        passwordErrorText = 'Пароль должен содержать только цифры!';
        passwordError = AuthError(errorText: passwordErrorText);
        passwordInputBorder = AlphabetDecorations.errorTextFieldBorder;
      } else {
        passwordErrorText = '';
        passwordError = Container();
        passwordInputBorder = AlphabetDecorations.textFieldBorder;
      }
    }

    setState(() {});

    if (nameErrorText == '' && passwordErrorText == '') {
      Map accessData = {
        'name': name,
        'password': password,
      };
      int userId = await services.getUserId(accessData);
      if (userId < 1) {
        commonError =
            const AuthError(errorText: 'Неправильное имя или пароль!');
        setState(() {});
      } else {
        commonError = Container();
        setState(() {});
        Navigator.pushNamed(
          context,
          AlphabetScreen.routeName,
          arguments: {'userId': userId},
        );
      }
    }
  }

  isCyrillic(String? s) {
    if (s == null) {
      return false;
    }
    RegExp exp = RegExp(r'[а-яА-ЯёЁ]+');
    String res = s.replaceAll(exp, '');
    return (res == '');
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
