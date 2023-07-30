import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/radio_button.dart';
import 'package:fitness/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'پست جدید'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            RoundedTextField(maxLines: 4, hint: 'متن پست'),
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
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: MainColors.primaryColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            const RadioButtonField(
              label: 'قابل مشاهده برای:',
              values: ['همه', 'دوستان'],
              initialValue: 'همه',
            ),
            const Expanded(child: SizedBox()),
            const FilledRoundedButton(label: 'ارسال'),
            if (GetPlatform.isAndroid)
              const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
