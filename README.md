# random password

Randomly generate a safe password.

The following rules of password are supported:
* length
* uppercase
* lowercase
* special characters (i.e. !"#\$%&'()*+,-./:;<=>?@[\]^_`{|}~)

## Usage

Example:

```dart
import 'package:random_password/random_password.dart';

main() {
  var rand = new RandomPassword(12, [
    new NumberRule(),
    new UppercaseRule(),
    new LowercaseRule(),
    new SpecialRule()
  ]);
  print(rand.generate());
}
```

Or you can use `RuleFlags` for convenience:

```dart
import 'package:random_password/random_password.dart';

main() {
  var rand = new RandomPassword.fromMask(12, (
    RuleFlags.number    |
    RuleFlags.uppercase |
    RuleFlags.lowercase |
    RuleFlags.special
  ));
  print(rand.generate());
}
```
