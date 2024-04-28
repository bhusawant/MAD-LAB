const _digits = [
  '',
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine'
];
const _teens = [
  'ten',
  'eleven',
  'twelve',
  'thirteen',
  'fourteen',
  'fifteen',
  'sixteen',
  'seventeen',
  'eighteen',
  'nineteen'
];
const _tens = [
  '',
  '',
  'twenty',
  'thirty',
  'forty',
  'fifty',
  'sixty',
  'seventy',
  'eighty',
  'ninety'
];
const _groups = ['', 'thousand', 'million', 'billion', 'trillion'];
String numberToWords(int num) {
  if (num == 0) {
    return 'zero';
  }
  final words = StringBuffer();
  var groupIndex = 0;
  final List<String> parts = [];
  while (num > 0) {
    final group = num % 1000;
    if (group > 0) {
      parts.insert(0, _threeDigitsToWords(group));
      if (groupIndex > 0) {
        parts.insert(1, _groups[groupIndex]);
      }
    }
    num ~/= 1000;
    groupIndex++;
  }
  words.writeAll(parts, ' ');
  return words.toString().trim();
}

String _threeDigitsToWords(int num) {
  final words = StringBuffer();
  if (num >= 100) {
    words.write(_digits[num ~/ 100]);
    words.write(' hundred ');
    num %= 100;
  }
  if (num >= 10) {
    if (num < 20) {
      words.write(_teens[num - 10]);
      // If it's a teen number, we're done
      return words.toString().trim();
    } else {
      words.write(_tens[num ~/ 10]);
      if (num % 10 != 0) {
        words.write('-'); // Hyphen between tens and ones
        words.write(_digits[num % 10]);
      }
    }
  } else if (num > 0) {
    words.write(_digits[num]);
  }
  return words.toString().trim();
}

void main() {
  int number = 3552;
  String numberInWords = numberToWords(number);
  print("$number in words: $numberInWords");
}
