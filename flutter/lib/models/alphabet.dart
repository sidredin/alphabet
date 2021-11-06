class Alphabet {
  final String mainLetter;
  final List<String> letters;

  Alphabet({
    required this.mainLetter,
    required this.letters,
  });

  factory Alphabet.fromJson(Map<String, dynamic> json) {
    return Alphabet(
      mainLetter: json['data']['mainLetter'],
      letters: List<String>.from(json['data']['letters'].map((x) => x)),
    );
  }
}
