import 'package:fitness/models/alarm.dart';
import 'package:fitness/screens/alarm_details.dart';
import 'package:fitness/utils/num_api.dart';
import 'package:fitness/utils/string_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:fitness/widgets/switch_field.dart';
import 'package:fitness/widgets/week_day_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AlarmItem extends StatelessWidget {
  final AlarmModel alarm;

  const AlarmItem(this.alarm);

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      onTap: () => Get.to(() => AlarmDetailsScreen(alarm)),
      padding: const EdgeInsets.only(bottom: 15, top: 15, right: 15),
      child: Row(
        children: <Widget>[
          Text(
            '${alarm.min.toTime().replaceWithPersianDigits()}:${alarm.min.toTime().replaceWithPersianDigits()}',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 32, color: MainColors.primaryColor),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  alarm.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: MainColors.grayDarkest,
                  ),
                ),
                WeekDaySelector(
                  readOnly: true,
                  isCompact: true,
                  initialData: alarm.selectedDays,
                ),
              ],
            ),
          ),
          SwitchField(initialValue: alarm.enabled),
        ],
      ),
    );
  }
}
