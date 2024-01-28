class Sentence {
  // field
  late String text;
  late bool isSecret;
  // constructor
  Sentence({this.text = '', this.isSecret = false});
  // method
  String fill(int ch) {
    if (!isSecret) {
      return text;
    }
    var len = text.length;
    return String.fromCharCodes(List.generate(len, (x) => ch));
  }
}

// pair of brackets
class Region {
  // field
  int start = 0;
  int end = 0;
  int byteStart = 0;
  int byteEnd = 0;
  // constructor
  Region({this.start = 0, this.end = 0, this.byteStart = 0, this.byteEnd = 0});
}

class Spoiler {
  final max = 300;
  // field
  String _input = '';
  List<Sentence> alt = [];
  // constructor
  Spoiler({String input = ''}) {
    setInput(input);
  }
  // setter
  void setInput(String input) {
    _input = input;
    alt = [];
    List<int> stack = []; // list of '[' positions
    List<Region> brackets = []; // list of bracket pairs

    for (int i = 0; i < _input.length; i++) {
      if (input[i] == '[') {
        stack.add(i);
      } else if (_input[i] == ']' && stack.isNotEmpty) {
        int start = stack.last;
        if (brackets.isNotEmpty) {
          Region prev = brackets.last;
          if (start < prev.start && i > prev.end) {
            brackets.removeLast();
            //continue;
          }
        }
        Region p = Region(start: start, end: i);
        brackets.add(p);
        stack.removeLast();
      }
    }
    int lastIndex = -1;
    for (Region p in brackets) {
      if (p.start > lastIndex) {
        alt.add(Sentence(text: _input.substring(lastIndex+1, p.start)));
      }
      String text = _input.substring(p.start+1, p.end);
      alt.add(Sentence(text: _removeBrackets(text), isSecret: true));
      lastIndex = p.end;
    }
    if (lastIndex < _input.length) {
      alt.add(Sentence(text: _input.substring(lastIndex+1)));
    }
  }

  String postText(int ch, String ellipsis) {
    var text = alt.map((e) => e.fill(ch)).join('');
    if (text.length <= max) {
      return text;
    }
    var body = text.substring(0, (max - ellipsis.length));
    return body + ellipsis;
  }

  // remove brackets
  String _removeBrackets(String text) {
    return text.replaceAll('[', '').replaceAll(']', '');
  }
}
