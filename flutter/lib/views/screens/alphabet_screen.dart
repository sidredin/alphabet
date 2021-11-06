import 'package:alphabet/models/alphabet.dart';
import 'package:alphabet/services.dart';
import 'package:alphabet/views/styling/alphabet_colors.dart';
import 'package:alphabet/views/styling/alphabet_text_styles.dart';
import 'package:alphabet/views/widgets/letter_button.dart';
import 'package:flutter/material.dart';

class AlphabetScreen extends StatefulWidget {
  const AlphabetScreen({Key? key}) : super(key: key);
  static const String routeName = 'alphabet';

  @override
  _AlphabetScreenState createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  Services services = Services();
  String mainLetter = '';
  List<String> letters = [];
  Color mainLetterColor = AlphabetColors.lightGrey;

  getLetters() async {
    Alphabet alphabet = await services.getLetters();
    mainLetter = alphabet.mainLetter;
    letters = alphabet.letters;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getLetters();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final int userId = args['userId'];
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: mainLetterColor,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    child: Align(
                      child: Text(
                        mainLetter,
                        style: AlphabetTextStyles.mainLetterTextStyle,
                      ),
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
                  children: getLetterButtonsList(letters, userId),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getLetterButtonsList(List<String> letters, int userId) {
    List<LetterButton> lettersList = [];
    for (var letter in letters) {
      lettersList.add(LetterButton(
        letter: letter,
        mainLetter: mainLetter,
        userId: userId,
        changeMainLetterBlockColor: () {
          setState(() {
            mainLetterColor = AlphabetColors.rightChoice;
          });
        },
      ));
    }
    return lettersList;
  }
}
