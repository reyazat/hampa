import 'package:fitness/models/activity.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/activity_item.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/drop_down_menu.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:fitness/widgets/toggle_button.dart';
import 'package:flutter/material.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen();

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  int expandedId = -1;

  var activities = [
    ActivityModel(
      title: 'تعداد قدم ها',
      icon: Icons.directions_walk,
      amount: 1500,
      unit: 'قدم',
      history: [
        ChartData(x: '۸/۵', y: 100),
        ChartData(x: '۸/۶', y: 60),
        ChartData(x: '۸/۷', y: 150),
        ChartData(x: '۸/۸', y: 200),
        ChartData(x: '۸/۹', y: 80),
        ChartData(x: '۸/۱۰', y: 180),
        ChartData(x: '۸/۱۱', y: 110),
        ChartData(x: '۸/۱۲', y: 140),
      ],
    ),
    ActivityModel(
      title: 'دوچرخه سواری',
      icon: Icons.directions_bike,
      amount: 15,
      unit: 'km',
      history: [
        ChartData(x: '۸/۵', y: 1),
        ChartData(x: '۸/۶', y: 6),
        ChartData(x: '۸/۷', y: 1.5),
        ChartData(x: '۸/۸', y: 2),
        ChartData(x: '۸/۹', y: 8),
        ChartData(x: '۸/۱۰', y: 1.8),
        ChartData(x: '۸/۱۱', y: 1.1),
        ChartData(x: '۸/۱۲', y: 1.4),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'فعالیت ها'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            RoundedCard(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: Text(
                      'همگام سازی با Google Fit',
                      style: TextStyle(
                        color: MainColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/google_fit.png', height: 40),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            RoundedCard(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: DropDownMenu(items: ['شنا', 'دوچرخه']),
                  ),
                  Text(
                    '00:00:00',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: MainColors.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 10),
                  FilledRoundedButtonSm(label: 'شروع'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const ToggleButton(items: ['امروز', 'این هفته', 'این ماه']),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  for (var i = 0; i < activities.length; i++)
                    ActivityItem(
                      activity: activities[i],
                      expanded: i == expandedId,
                      onTap: () {
                        /// If item has already been opened, set [expandedId] to -1. This means that all
                        /// items have to be collapsed
                        if (i == expandedId) {
                          expandedId = -1;
                        } else {
                          expandedId = i;
                        }
                        setState(() {});
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
