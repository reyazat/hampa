import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/info.dart';
import 'package:fitness/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Expanded(child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 60),
                    child: Text(
                      'احراز هویت',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                        color: MainColors.grayDarkest,
                      ),
                    ),
                  ),
                  RoundedTextField(hint: 'کد ملی'),
                  const SizedBox(height: 15),
                  const Info('برای استفاده از ویژگی همپا و گفت و گو باید هویت شما احراز شود'),
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
