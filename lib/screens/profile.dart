import 'package:fitness/utils/string_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/banners.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'پروفایل'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            RoundedCard(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'حامد جعفرزاده',
                          style: TextStyle(
                            color: MainColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '0913 123 4567'.replaceWithPersianDigits(),
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(
                            color: MainColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '@hamed_2020',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: MainColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const FilledRoundedButtonSm(label: 'ویرایش', width: 100),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/images/avatar1.jpg'),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                buildPropertyItem('قد', '۱۸۰', 'سانتی متر'),
                const SizedBox(width: 15),
                buildPropertyItem('سن', '۳۰', 'سال'),
                const SizedBox(width: 15),
                buildPropertyItem('وزن', '۸۵', 'کیلوگرم'),
              ],
            ),
            RoundedCard(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: const <Widget>[
                  Icon(Icons.place, color: MainColors.primaryColor),
                  Expanded(
                    child: Text(
                      ' محل سکونت',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        color: MainColors.primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    'اصفهان',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: MainColors.grayDarkest,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const AlarmBanner(),
            const SizedBox(height: 15),
            const MentalHealthBanner(),
          ],
        ),
      ),
    );
  }

  Widget buildPropertyItem(String title, String amount, String unit) {
    return Expanded(
      child: RoundedCard(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                color: MainColors.primaryColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              amount,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: MainColors.grayDarkest,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              unit,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: MainColors.primaryColor,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
