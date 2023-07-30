import 'package:flutter/material.dart';
import 'package:fitness/values/colors.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';

class DatePickerTimeLine extends StatefulWidget {
  final void Function(DateTime)? onSelectionChanged;

  const DatePickerTimeLine({this.onSelectionChanged});

  @override
  State<DatePickerTimeLine> createState() => _DatePickerTimeLineState();
}

class _DatePickerTimeLineState extends State<DatePickerTimeLine> {
  var startDate = DateTime.now();
  var selectedDate = DateTime.now().add(const Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    var endDate = startDate.add(const Duration(days: 3));
    selectedDate = startDate.add(const Duration(days: 1));

    return Container(
      decoration: BoxDecoration(
        color: MainColors.grayLightest,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (startDate.isAfter(DateTime.now())) {
                setState(() {
                  startDate = startDate.subtract(const Duration(days: 4));
                });
              }
            },
            child: const Icon(Icons.arrow_back_ios_sharp, size: 20, color: MainColors.grayDarkest),
          ),
          Expanded(
            child: FlutterDatePickerTimeline(
              calendarMode: CalendarMode.jalali,
              startDate: startDate,
              endDate: endDate,
              initialSelectedDate: selectedDate,
              selectedItemBackgroundColor: MainColors.primaryColor,
              unselectedItemBackgroundColor: Colors.white,
              unselectedItemTextStyle: const TextStyle(
                color: MainColors.grayDarkest,
                fontWeight: FontWeight.w600,
                fontFamily: 'Shabnam',
                fontSize: 15,
              ),
              selectedItemTextStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Shabnam',
                color: Colors.white,
                fontSize: 15,
              ),
              selectedItemMargin: const EdgeInsets.symmetric(horizontal: 4),
              unselectedItemMargin: const EdgeInsets.symmetric(horizontal: 4),
              selectedItemWidth: 120,
              onSelectedDateChange: (dateTime) {
                widget.onSelectionChanged?.call(dateTime as DateTime);
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                startDate = startDate.add(const Duration(days: 4));
              });
            },
            child: const Icon(Icons.arrow_forward_ios_sharp, size: 20, color: MainColors.grayDarkest),
          ),
        ],
      ),
    );
  }
}
