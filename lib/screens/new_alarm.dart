import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/rounded_text_field.dart';
import 'package:fitness/widgets/time_picker.dart';
import 'package:fitness/widgets/week_day_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAlarmScreen extends StatelessWidget {
  const NewAlarmScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'افزودن یادآور'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: TimePicker(),
                  ),
                  const WeekDaySelector(),
                  const SizedBox(height: 10),
                  RoundedTextField(hint: 'عنوان'),
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
