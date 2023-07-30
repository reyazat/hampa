import 'package:fitness/models/time_slot.dart';
import 'package:fitness/utils/num_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/counter.dart';
import 'package:fitness/widgets/date_picker_timeline.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketBookScreen extends StatefulWidget {
  const TicketBookScreen();

  @override
  State<TicketBookScreen> createState() => _TicketBookScreenState();
}

class _TicketBookScreenState extends State<TicketBookScreen> {
  late TimeSlotModel selectedSlot;
  final slots = [
    TimeSlotModel(id: 1, gender: 'آقایان', from: 12, to: 14),
    TimeSlotModel(id: 2, gender: 'آقایان', from: 14, to: 16),
    TimeSlotModel(id: 3, gender: 'آقایان', from: 16, to: 18),
    TimeSlotModel(id: 4, gender: 'آقایان', from: 18, to: 20),
    TimeSlotModel(id: 5, gender: 'آقایان', from: 20, to: 22),
  ];

  @override
  void initState() {
    selectedSlot = slots.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'خرید بلیط'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            const DatePickerTimeLine(),
            const SizedBox(height: 20),
            RoundedCard(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  for (var slot in slots)
                    RoundedCard(
                      color: selectedSlot.id == slot.id ? MainColors.primaryColor : null,
                      padding: const EdgeInsets.all(10),
                      onTap: () {
                        setState(() {
                          selectedSlot = slot;
                        });
                      },
                      child: Text(
                        'سانس ${slot.gender} | ساعت ${slot.from.toFaString()} - ${slot.to.toFaString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: selectedSlot.id == slot.id ? Colors.white : MainColors.grayDarkest,
                          fontSize: 15,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              children: const <Widget>[
                Text(
                  'تعداد',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: MainColors.grayDarkest,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 20),
                Counter(),
              ],
            ),
            const SizedBox(height: 20),
            RoundedCard(
              padding: const EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: GetPlatform.isAndroid ? 15 : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    '۲۵,۰۰۰ تومان',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: MainColors.grayDarkest,
                      fontSize: 16,
                    ),
                  ),
                  FilledRoundedButtonSm(
                    label: 'پرداخت',
                    width: 100,
                    onTap: () {},
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
