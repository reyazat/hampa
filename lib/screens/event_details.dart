import 'package:fitness/models/event.dart';
import 'package:fitness/utils/jalali_api.dart';
import 'package:fitness/utils/string_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

class EventDetailsScreen extends StatelessWidget {
  final EventModel event;

  const EventDetailsScreen(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'جزئیات رویداد',
        actions: [
          IconButton(
            icon: const Icon(Icons.report_outlined, size: 28),
            onPressed: () => reportAbuse(context),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(event.imageUrl, height: 200, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              child: Text(
                event.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: MainColors.grayDarkest,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 5),
            if (event.isRepetitive && event.repeatTime != null)
              Text(
                'هر روز ساعت ${event.repeatTime?.format(context).replaceWithPersianDigits()}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: MainColors.grayDarkest,
                  fontSize: 14,
                ),
              ),
            if (!event.isRepetitive && event.startDate != null && event.endDate != null)
              Text(
                'از ${Jalali.fromDateTime(event.startDate!).toDayMonthString()} تا ${Jalali.fromDateTime(event.endDate!).toDayMonthString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: MainColors.grayDarkest,
                  fontSize: 14,
                ),
              ),
            const SizedBox(height: 20),
            Text(
              event.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: MainColors.grayDarkest, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void reportAbuse(BuildContext context) {
    ModalSheet.show(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          Text(
            'گزارش اشکال',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600, color: MainColors.grayDarkest, fontSize: 18),
          ),
        ],
      ),
      height: 400,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    );
  }
}
