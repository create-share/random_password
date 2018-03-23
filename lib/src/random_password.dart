import 'dart:math';
import 'rules.dart';

List<dynamic> _shuffle(List<dynamic> arr) {
  final len = arr.length;
  final rand = new Random();
  for (var i = 0; i < len - 1; i++) {
    final idx = rand.nextInt(len - i);
    final temp = arr[idx];
    arr[idx] = arr[len - i - 1];
    arr[len - i - 1] = temp;
  }
  return arr;
}

class RandomPassword {
  final int length;
  final List<PasswordRule> rules;

  RandomPassword(this.length, List<PasswordRule> this.rules);

  RandomPassword.fromMask(this.length, int mask)
      : rules = getRulesFromMask(mask);

  static List<PasswordRule> getRulesFromMask(int mask) {
    var rules = <PasswordRule>[];
    if (mask & RuleFlags.number != 0) {
      rules.add(new NumberRule());
    }
    if (mask & RuleFlags.uppercase != 0) {
      rules.add(new UppercaseRule());
    }
    if (mask & RuleFlags.lowercase != 0) {
      rules.add(new LowercaseRule());
    }
    if (mask & RuleFlags.special != 0) {
      rules.add(new SpecialRule());
    }
    return rules;
  }

  String generate() {
    var rulesLen = rules.length;
    var charList = <String>[];
    for (var i = 0, rand = new Random(); i < length; i++) {
      var index = i < rulesLen ? i : rand.nextInt(rulesLen);
      charList.add(rules[index].getChar());
    }
    return _shuffle(charList).join('');
  }
}
