import 'package:fitness/models/event.dart';
import 'package:fitness/screens/new_event.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/drop_down_menu.dart';
import 'package:fitness/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen();

  @override
  Widget build(BuildContext context) {
    var events = [
      EventModel(
        imageUrl: 'assets/images/group_exercise.jpg',
        title: 'ورزش همگانی در پارک ناژوان',
        description:
            'فدراسیون ورزش های همگانی با توجه به مسئولیت ساماندهی، طراحی و اجرای فعالیت های ورزشی، چهارمحور اصلی و سه برنامه برای سلامت و تندرستی مردم طراحی نموده است که با توجه به گستردگی و وسعت عمل آن هماهنگی و همکاری سازمان ها و وزارت خانه های مختلف را می طلبد. چهارمحور اصلی فدراسیون ورزش همگانی چنین اعلام شده است',
        isRepetitive: true,
        repeatTime: const TimeOfDay(hour: 7, minute: 0),
      ),
      EventModel(
        imageUrl: 'assets/images/vollyball.jpg',
        title: 'مسابقات قهرمانی والیبال محلات اصفهان',
        description:
            'معاونت ورزشی تفریحی سازمان فرهنگی، اجتماعی و ورزشی شهرداری اصفهان، با توجه به اهمیت این رشته اقدام به برگزاری مسابقات والیبال محلات شهر اصفهان کرد. این مسابقات به مدت ۶ هفته در محلات مناطق پانزده‌گانه شهرداری اصفهان برگزار شد. استقبال از این مسابقات بسیار قابل توجه بود و تعداد شرکت کنندگان در این رویداد نشان از توجه مردم شهر اصفهان به این ورزش و همراهی آن‌ها با برنامه‌هایی است که توسط شهرداری برگزار می‌شود.',
        isRepetitive: false,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 7)),
      ),
    ];

    return Scaffold(
      appBar: MyAppBar(
        title: 'رویداد ها',
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 28),
            onPressed: () => Get.to(() => const NewEvent()),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DropDownMenu(
                  items: const [
                    'جدید ترین',
                    'نزدیک ترین',
                  ],
                  onChange: () {},
                ),
                const Text(
                  'فیلتر',
                  style: TextStyle(color: MainColors.primaryColor, fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [for (var event in events) EventItem(event)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
