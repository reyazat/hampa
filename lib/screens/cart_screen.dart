import 'package:fitness/models/cart.dart';
import 'package:fitness/screens/order_screen.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/cart_item.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen();

  @override
  Widget build(BuildContext context) {
    var carts = [
      CartModel(
        title: 'دمبل',
        quantity: 3,
        price: 500000,
        priceAfterDiscount: 250000,
        thumbImage: 'assets/images/dumbbells.png',
      )
    ];

    return Scaffold(
      appBar: MyAppBar(title: 'سبد خرید (1)'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  for (var cart in carts) CartItem(cart),
                ],
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
                    label: 'ثبت سفارش',
                    width: 120,
                    onTap: () {
                      Get.to(() => const OrderScreen());
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
