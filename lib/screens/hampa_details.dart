import 'package:fitness/models/hampa.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/modal_sheet.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:fitness/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class HampaDetails extends StatelessWidget {
  final HampaModel hampa;

  const HampaDetails(this.hampa);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'جزئیات همپا',
        actions: [
          IconButton(
            icon: const Icon(Icons.report_outlined, size: 28),
            onPressed: () => reportAbuse(context),
          )
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(hampa.imageUrl),
                ),
                const SizedBox(width: 15),
                Column(
                  children: <Widget>[
                    Text(
                      hampa.fullName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: MainColors.grayDarkest,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.room, color: MainColors.primaryColor),
                        Text(
                          hampa.address,
                          style: const TextStyle(fontWeight: FontWeight.w600, color: MainColors.primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            RoundedCard(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(15),
              child: Text(
                hampa.description,
                style: const TextStyle(color: MainColors.grayDarkest, fontSize: 15),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/map_placeholder.png', height: 200, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: RoundedTextField(hint: 'متن پیام', maxLines: 4),
            ),
            Row(
              children: [
                FilledRoundedButtonSm(label: 'ارسال پیام', width: 100, onTap: () {}),
              ],
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
            'گزارش تخلف',
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
