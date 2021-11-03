import 'package:alphabet/views/widgets/letter_button.dart';
import 'package:flutter/material.dart';

class AlphabetScreen extends StatefulWidget {
  const AlphabetScreen({Key? key}) : super(key: key);
  static const String routeName = 'alphabet';

  @override
  _AlphabetScreenState createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  final letters = [
    'А',
    'Б',
    'В',
    'Г',
    'Ы',
    'А',
    'Б',
    'В',
    'Г',
    'Ы',
    'А',
    'Б',
    'В',
    'Г',
    'Ы',
    'А',
    'Б',
    'В',
    'Г',
    'Ы',
    'А',
    'Б',
    'В',
    'Г',
    'Ы',
    'А',
    'Б',
    'В',
    'Г',
    'Ы',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Expanded(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    child: const LetterButton(
                      letter: 'Ы',
                      onPressed: null,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 23,
                  crossAxisSpacing: 23,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: getLetterButtonsList(letters),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getLetterButtonsList(List<String> letters) {
    List<LetterButton> lettersList = [];
    for (var letter in letters) {
      lettersList.add(LetterButton(
        letter: letter,
        onPressed: () {
          // print(letter);
        },
      ));
    }
    return lettersList;
  }
}
