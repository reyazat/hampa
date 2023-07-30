import 'package:fitness/utils/num_api.dart';
import 'package:fitness/utils/string_api.dart';
import 'package:shamsi_date/shamsi_date.dart';

extension JalaliExtension on Jalali {
  String toTimeString() {
    return '${hour.toFaString()}:${minute.toFaString()}';
  }

  String toDateString() {
    final f = formatter;
    return '${f.d} ${f.mN} ${f.yyyy}'.replaceWithPersianDigits();
  }

  String toDayMonthString() {
    final f = formatter;
    return '${f.d} ${f.mN}'.replaceWithPersianDigits();
  }
}