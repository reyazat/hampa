import 'package:fitness/utils/string_api.dart';

extension NumExtension on num {
  String toFaString() {
    return toString().replaceWithPersianDigits();
  }

  String toMoney() {
    var s = toString().replaceFirst('-', '').split('');
    for (int i = s.length; i >= 0; i -= 3) {
      if (i - 3 > 0) {
        s.insert(i - 3, ',');
      }
    }
    return s.join().replaceWithPersianDigits();
  }

  String toTime() {
    if (toString().length == 1) {
      return '0${toString()}';
    }
    return toString();
  }
}
