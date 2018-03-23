import 'dart:math';

class RuleFlags {
  static const number = 1;
  static const uppercase = 1 << 1;
  static const lowercase = 1 << 2;
  static const special = 1 << 3;
}

abstract class PasswordRule {
  int get flag;
  String get scope;
  Random random = new Random();
  String getChar() => scope[random.nextInt(scope.length)];
}

class NumberRule extends PasswordRule {
  final int flag = RuleFlags.number;
  final String scope = '0123456789';
}

class UppercaseRule extends PasswordRule {
  final int flag = RuleFlags.uppercase;
  final String scope = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
}

class LowercaseRule extends PasswordRule {
  final int flag = RuleFlags.lowercase;
  final String scope = 'abcdefghijklmnopqrstuvwxyz';
}

class SpecialRule extends PasswordRule {
  final flag = RuleFlags.special;
  final String scope = '!"#\$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
}
