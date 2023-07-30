import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewHampaScreen extends StatelessWidget {
  const NewHampaScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'یافتن همپا'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/images/map_placeholder.png', height: 200, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: RoundedTextField(hint: 'محله، خیابان، ...'),
                    ),
                    RoundedTextField(hint: 'توضیح', maxLines: 4),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: GetPlatform.isAndroid ? 20 : 0),
              child: const FilledRoundedButton(label: 'ارسال'),
            ),
          ],
        ),
      ),
    );
  }
}
