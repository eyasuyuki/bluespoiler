class Sentence {
  // field
  String text = '';
  bool isSecret = false;
  // constructor
  Sentence();

  String secret(int ch) {
    if (!isSecret) {
      return text;
    }
    var len = text.length;
    return String.fromCharCodes(List.generate(len, (x) => ch));
  }
}

class Spoiler {
  // field
  String input = '';
  List<Sentence> alt;
  // constructor
  Spoiler();
}