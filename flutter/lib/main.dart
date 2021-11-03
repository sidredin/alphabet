import 'package:alphabet/views/screens/alphabet_screen.dart';
import 'package:alphabet/views/screens/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Алфавит',
      theme: ThemeData(),
      initialRoute: AlphabetScreen.routeName,
      routes: {
        AuthScreen.routeName: (context) => const AuthScreen(),
        AlphabetScreen.routeName: (context) => const AlphabetScreen(),
      },
    );
  }
}
