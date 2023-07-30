import 'package:fitness/models/alarm.dart';
import 'package:fitness/screens/new_alarm.dart';
import 'package:fitness/widgets/alarm_item.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen();

  @override
  Widget build(BuildContext context) {
    var alarms = [
      AlarmModel(
        hour: 16,
        min: 30,
        title: 'دراز نشست و شنا',
        selectedDays: {
          'ش': false,
          'ی': true,
          'د': true,
          'س': false,
          'چ': false,
          'پ': true,
          'ج': false,
        },
      )
    ];

    return Scaffold(
      appBar: MyAppBar(
        title: 'یادآور ورزش',
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 28),
            onPressed: () => Get.to(() => const NewAlarmScreen()),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            for (var alarm in alarms) AlarmItem(alarm),
          ],
        ),
      ),
    );
  }
}
