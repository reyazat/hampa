import 'package:fitness/utils/num_api.dart';
import 'package:fitness/utils/string_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final int? initialHour;
  final int? initialMin;
  final void Function(int hour, int min)? onChange;

  const TimePicker({this.initialHour, this.initialMin, this.onChange});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late int hour;
  late int min;

  @override
  void initState() {
    hour = widget.initialHour ?? 8;
    min = widget.initialMin ?? 30;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: MainColors.primaryColor,
        fontFamily: 'Shabnam',
        fontSize: 64,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 85,
            child: Column(
              children: [
                GestureDetector(
                  onTap: incrementMin,
                  child: const Icon(
                    Icons.arrow_drop_up,
                    size: 60,
                    color: MainColors.grayLight,
                  ),
                ),
                Text(min.toTime().replaceWithPersianDigits()),
                GestureDetector(
                  onTap: decrementMin,
                  child: const Icon(
                    Icons.arrow_drop_down,
                    size: 60,
                    color: MainColors.grayLight,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 40,
            child: Text(':', textAlign: TextAlign.center),
          ),
          SizedBox(
            width: 85,
            child: Column(
              children: [
                GestureDetector(
                  onTap: incrementHour,
                  child: const Icon(
                    Icons.arrow_drop_up,
                    size: 60,
                    color: MainColors.grayLight,
                  ),
                ),
                Text(hour.toTime().replaceWithPersianDigits()),
                GestureDetector(
                  onTap: decrementHour,
                  child: const Icon(
                    Icons.arrow_drop_down,
                    size: 60,
                    color: MainColors.grayLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void incrementHour() {
    widget.onChange?.call(hour, min);
    setState(() {
      if (hour == 23) {
        hour = 0;
      } else {
        hour++;
      }
    });
  }

  void decrementHour() {
    widget.onChange?.call(hour, min);
    setState(() {
      if (hour == 0) {
        hour = 23;
      } else {
        hour--;
      }
    });
  }

  void incrementMin() {
    widget.onChange?.call(hour, min);
    setState(() {
      if (min == 55) {
        min = 0;
      } else {
        min += 5;
      }
    });
  }

  void decrementMin() {
    widget.onChange?.call(hour, min);
    setState(() {
      if (min == 0) {
        min = 55;
      } else {
        min -= 5;
      }
    });
  }
}
