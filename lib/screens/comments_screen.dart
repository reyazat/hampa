import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/rounded_text_field.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/custom_rating_bar.dart';
import 'package:fitness/widgets/modal_sheet.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'نظرات',
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 28),
            onPressed: () => addReview(context),
          )
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontFamily: 'Shabnam',
            fontWeight: FontWeight.w600,
            color: MainColors.grayDarkest,
          ),
          child: ListView(
            children: [
              RoundedCard(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        CustomRatingBar(4),
                        Text('۵ مرداد'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('خیلی استخر خوبیه', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              RoundedCard(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        CustomRatingBar(1),
                        Text('۵ مرداد'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('خیلی بد بود\nآبش کثیف بود\nبوی وایتکس میداد', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addReview(BuildContext context) {
    ModalSheet.show(
      context: context,
      height: 600,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'امتیاز شما',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: MainColors.grayDarkest),
              ),
              CustomRatingBar(5, enabled: true, size: 25),
            ],
          ),
          const SizedBox(height: 20),
          RoundedTextField(hint: 'نظر شما ...', maxLines: 4),
          const Expanded(child: SizedBox()),
          const FilledRoundedButton(label: 'ثبت نظر'),
        ],
      ),
    );
  }
}
