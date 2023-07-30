import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/checkbox_field.dart';
import 'package:fitness/widgets/date_picker_timeline.dart';
import 'package:fitness/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewEvent extends StatelessWidget {
  const NewEvent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'افزودن رویداد'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  RoundedTextField(maxLines: 4, hint: 'توضیحات'),
                  const SizedBox(height: 15),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {},
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.add_photo_alternate_outlined, color: MainColors.primaryColor),
                        SizedBox(width: 10),
                        Text(
                          'افزودن تصویر',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: MainColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 80, bottom: 15),
                    child: DatePickerTimeLine(),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RoundedTextField(hint: 'از ساعت'),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: RoundedTextField(hint: 'تا ساعت'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CheckboxField(label: 'این رویداد هر روز برگزار می شود', initialValue: true),
                ],
              ),
            ),
            const FilledRoundedButton(label: 'ارسال'),
            if (GetPlatform.isAndroid) const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
