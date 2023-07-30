import 'package:fitness/models/event.dart';
import 'package:fitness/screens/event_details.dart';
import 'package:fitness/utils/jalali_api.dart';
import 'package:fitness/utils/string_api.dart';
import 'package:fitness/widgets/gradient_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamsi_date/shamsi_date.dart';

class EventItem extends StatelessWidget {
  final EventModel event;

  const EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GradiantImage(
        onTap: () => Get.to(() => EventDetailsScreen(event)),
        imageUrl: event.imageUrl,
        label: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                event.title,
                style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 5),
              if (event.isRepetitive && event.repeatTime != null)
                Text(
                  'هر روز ساعت ${event.repeatTime?.format(context).replaceWithPersianDigits()}',
                  style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 13),
                ),
              if (!event.isRepetitive && event.startDate != null && event.endDate != null)
                Text(
                  'از ${Jalali.fromDateTime(event.startDate!).toDayMonthString()} تا ${Jalali.fromDateTime(event.endDate!).toDayMonthString()}',
                  style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 13),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
