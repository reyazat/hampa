import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/radio_button.dart';
import 'package:fitness/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 60),
                    child: Text(
                      'ثبت نام',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                        color: MainColors.grayDarkest,
                      ),
                    ),
                  ),
                  RoundedTextField(
                    padding: const EdgeInsets.only(bottom: 10),
                    hint: 'نام',
                  ),
                  RoundedTextField(
                    padding: const EdgeInsets.only(bottom: 10),
                    hint: 'نام خانوادگی',
                  ),
                  RoundedTextField(
                    padding: const EdgeInsets.only(bottom: 10),
                    hint: 'محل سکونت',
                  ),
                  RoundedTextField(
                    padding: const EdgeInsets.only(bottom: 10),
                    hint: 'وزن',
                    suffixText: 'کیلوگرم',
                  ),
                  RoundedTextField(
                    padding: const EdgeInsets.only(bottom: 10),
                    hint: 'سن',
                    suffixText: 'سال',
                  ),
                  RoundedTextField(
                    padding: const EdgeInsets.only(bottom: 10),
                    hint: 'قد',
                    suffixText: 'سانتی متر',
                  ),
                  RadioButtonField(
                    label: 'جنسیت',
                    values: const ['زن', 'مرد'],
                    onChanged: (selection) {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: GetPlatform.isAndroid ? 20 : 0),
              child: const FilledRoundedButton(label: 'تایید'),
            ),
          ],
        ),
      ),
    );
  }
}
