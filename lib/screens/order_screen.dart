import 'package:fitness/models/address.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen();

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final addresses = [
    AddressModel(id: 1, city: 'اصفهان', address: 'خیابان توحید، کوچه ۱۳، بن بست میخک، پلاک ۱۸ واحد ۴'),
    AddressModel(
        id: 2, city: 'اصفهان', address: 'اصفهان، خیابان باهنر، کوچه ۲۳، کوچه خدمتکن پلاک ۱۲، واحد ۴'),
  ];

  late AddressModel selectedAddress = addresses.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'ثبت سفارش'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Expanded(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Shabnam',
                  color: MainColors.grayDarkest,
                  fontSize: 16,
                ),
                child: ListView(
                  children: [
                    RoundedCard(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text('جمع سبد خرید'),
                              Text('۲۵۰,۰۰۰ تومان', style: TextStyle(color: MainColors.primaryColor)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text('هزینه ارسال'),
                              Text('۴۰,۰۰۰ تومان', style: TextStyle(color: MainColors.primaryColor)),
                            ],
                          ),
                          const Divider(color: Colors.white, thickness: 2, height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text('مبلغ کل'),
                              Text('۲۹۰,۰۰۰ تومان', style: TextStyle(color: MainColors.primaryColor)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    for (var address in addresses)
                      RoundedCard(
                        color: selectedAddress.id == address.id ? MainColors.primaryColor : null,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(10),
                        onTap: () {
                          setState(() {
                            selectedAddress = address;
                          });
                        },
                        child: Text(
                          '${address.city}، ${address.address}',
                          style: TextStyle(color: selectedAddress.id == address.id ? Colors.white : null),
                        ),
                      ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.add, color: MainColors.primaryColor),
                        SizedBox(width: 5),
                        Text(
                          'آدرس جدید',
                          style: TextStyle(color: MainColors.primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            RoundedCard(
              padding: const EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: GetPlatform.isAndroid ? 15 : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    '۲۵۰,۰۰۰ تومان',
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
