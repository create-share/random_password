import 'package:random_password/random_password.dart';

// RandomPassword
main(List<String> args) {
  var r1 = new RandomPassword(12, [
    new NumberRule(),
    new UppercaseRule(),
    new LowercaseRule(),
    new SpecialRule()
  ]);
  print(r1.generate());
  print(r1.generate());
  print(r1.generate());

  var r2 = new RandomPassword.fromMask(
      12,
      (RuleFlags.number |
          RuleFlags.uppercase |
          RuleFlags.lowercase |
          RuleFlags.special));
  print(r2.generate());
  print(r2.generate());
  print(r2.generate());
}
