import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';

class WeekDaySelector extends StatefulWidget {
  final bool readOnly;
  final bool isCompact;
  final Map<String, bool>? initialData;
  final void Function(Map<String, bool>)? onChange;

  const WeekDaySelector({this.initialData, this.readOnly = false, this.isCompact = false, this.onChange});

  @override
  State<WeekDaySelector> createState() => _WeekDaySelectorState();
}

class _WeekDaySelectorState extends State<WeekDaySelector> {
  late final Map<String, bool> days;

  @override
  void initState() {
    days = widget.initialData ??
        {
          'ش': false,
          'ی': false,
          'د': false,
          'س': false,
          'چ': false,
          'پ': false,
          'ج': false,
        };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 10,
        right: widget.isCompact ? 0 : 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          for (var day in days.entries)
            GestureDetector(
              onTap: () {
                if (!widget.readOnly) {
                  widget.onChange?.call(days);
                  setState(() {
                    days[day.key] = !day.value;
                  });
                }
              },
              child: Container(
                height: widget.isCompact ? 20 : 35,
                width: widget.isCompact ? 20 : 35,
                decoration: BoxDecoration(
                  color: day.value ? MainColors.primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    day.key,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: widget.isCompact ? 13 : 20,
                      color: day.value ? Colors.white : MainColors.grayDarkest,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
