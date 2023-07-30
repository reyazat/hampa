import 'package:fitness/models/alarm.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/confirm_dialog.dart';
import 'package:fitness/widgets/rounded_text_field.dart';
import 'package:fitness/widgets/time_picker.dart';
import 'package:fitness/widgets/week_day_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlarmDetailsScreen extends StatelessWidget {
  final AlarmModel alarm;

  const AlarmDetailsScreen(this.alarm);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'جزئیات یادآور',
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outlined, size: 28),
            onPressed: () {
              ConfirmDialog.show(
                context,
                title: 'حذف یادآور',
                confirm: 'حذف',
                message: 'آیا از حذف این یادآور اطمینان دارید؟',
                buttonWidth: 70,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: TimePicker(initialHour: alarm.hour, initialMin: alarm.min),
                  ),
                  WeekDaySelector(initialData: alarm.selectedDays),
                  const SizedBox(height: 10),
                  RoundedTextField(hint: 'عنوان', value: alarm.title),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: GetPlatform.isAndroid ? 20 : 0),
              child: const FilledRoundedButton(label: 'ذخیره'),
            ),
          ],
        ),
      ),
    );
  }
}
