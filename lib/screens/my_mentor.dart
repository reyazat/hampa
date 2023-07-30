import 'package:fitness/screens/chat_list.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/custom_rating_bar.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:fitness/widgets/toggle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

class MyMentor extends StatefulWidget {
  const MyMentor();

  @override
  State<MyMentor> createState() => _MyMentorState();
}

class _MyMentorState extends State<MyMentor> {
  final controller = PageController(viewportFraction: 0.9);
  var selectedWeek = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'مربی من',
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () => Get.to(() => const ChatListScreen()),
              child: const Icon(CupertinoIcons.chat_bubble_2, size: 30),
            ),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/avatar2.jpg'),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'حامد جعفرزاده',
                      style: TextStyle(
                        color: MainColors.grayDarkest,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomRatingBar(3.5),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: ToggleButton(items: ['برنامه ورزشی', 'برنامه غذایی']),
            ),
            buildTimeline(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: PageView(
                  padEnds: false,
                  controller: controller,
                  children: <Widget>[
                    RoundedCard(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(15),
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          color: MainColors.grayDarkest,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Shabnam',
                          fontSize: 16,
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: Text('جلسه اول', style: TextStyle(color: MainColors.primaryColor)),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: const <Widget>[
                                  Icon(Icons.play_circle_outlined, color: MainColors.primaryColor),
                                  SizedBox(width: 10),
                                  Expanded(child: Text('تردمیل')),
                                  Text('۲۰ دقیقه')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: const <Widget>[
                                  Icon(Icons.play_circle_outlined, color: MainColors.primaryColor),
                                  SizedBox(width: 10),
                                  Expanded(child: Text('پرس سینه')),
                                  Text('۴x۱۰')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: const <Widget>[
                                  Icon(Icons.play_circle_outlined, color: MainColors.primaryColor),
                                  SizedBox(width: 10),
                                  Expanded(child: Text('هالتر')),
                                  Text('۳x۸')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: const <Widget>[
                                  Icon(Icons.play_circle_outlined, color: MainColors.primaryColor),
                                  SizedBox(width: 10),
                                  Expanded(child: Text('جلو پا')),
                                  Text('۳x۸')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RoundedCard(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(15),
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          color: MainColors.grayDarkest,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Shabnam',
                          fontSize: 16,
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: Text('جلسه اول', style: TextStyle(color: MainColors.primaryColor)),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: const <Widget>[
                                  Icon(Icons.play_circle_outlined, color: MainColors.primaryColor),
                                  SizedBox(width: 10),
                                  Expanded(child: Text('تردمیل')),
                                  Text('۲۰ دقیقه')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: const <Widget>[
                                  Icon(Icons.play_circle_outlined, color: MainColors.primaryColor),
                                  SizedBox(width: 10),
                                  Expanded(child: Text('پرس سینه')),
                                  Text('۴x۱۰')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: const <Widget>[
                                  Icon(Icons.play_circle_outlined, color: MainColors.primaryColor),
                                  SizedBox(width: 10),
                                  Expanded(child: Text('هالتر')),
                                  Text('۳x۸')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: const <Widget>[
                                  Icon(Icons.play_circle_outlined, color: MainColors.primaryColor),
                                  SizedBox(width: 10),
                                  Expanded(child: Text('جلو پا')),
                                  Text('۳x۸')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimeline() {
    final weeks = [
      'هفته اول',
      'هفته دوم',
      'هفته سوم',
      'هفته چهارم',
      'هفته پنجم',
    ];

    Color getColor(int index) {
      if (index <= selectedWeek) {
        return MainColors.primaryColor;
      } else {
        return MainColors.grayMid;
      }
    }

    return SizedBox(
      height: 90,
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.horizontal,
          nodePosition: 0,
          connectorTheme: const ConnectorThemeData(space: 30, thickness: 3),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          contentsBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 5, left: 10, right: index > 0 ? 10 : 0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedWeek = index;
                  });
                },
                child: Text(
                  weeks[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: getColor(index),
                  ),
                ),
              ),
            );
          },
          indicatorBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedWeek = index;
                });
              },
              child: DotIndicator(size: 16, color: getColor(index)),
            );
          },
          connectorBuilder: (_, index, type) {
            if (index > 0) {
              return SolidLineConnector(color: getColor(index));
            } else {
              return null;
            }
          },
          itemCount: weeks.length,
        ),
      ),
    );
  }
}
