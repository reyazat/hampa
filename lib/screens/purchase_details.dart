import 'package:fitness/models/purchase_history.dart';
import 'package:fitness/utils/jalali_api.dart';
import 'package:fitness/utils/num_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shamsi_date/shamsi_date.dart';

class PurchaseDetails extends StatelessWidget {
  final PurchaseHistoryModel purchaseHistory;
  final Jalali jDate;

  PurchaseDetails(this.purchaseHistory) : jDate = Jalali.fromDateTime(purchaseHistory.dateTime);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'جزئیات خرید'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w600,
                  color: MainColors.grayDarkest,
                ),
                child: ListView(
                  children: <Widget>[
                    RoundedCard(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('زمان و تاریخ'),
                                Text('${jDate.toDateString()} - ${jDate.toTimeString()}'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(child: Text('کد پیگیری')),
                                GestureDetector(
                                  child: const Icon(Icons.copy, color: MainColors.primaryColor, size: 22),
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(text: purchaseHistory.transactionId));
                                  },
                                ),
                                const SizedBox(width: 10),
                                Text(purchaseHistory.transactionId),
                              ],
                            ),
                          ),
                          if (purchaseHistory.type == PurchaseType.product)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('وضعیت سفارش'),
                                  RoundedCard(
                                    color: MainColors.primaryColor,
                                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                                    child: Text(
                                      '${purchaseHistory.status}',
                                      style: const TextStyle(color: Colors.white, fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('مبلغ کل'),
                                Text(
                                  '${purchaseHistory.totalPrice.toMoney()} تومان',
                                  style: const TextStyle(color: MainColors.primaryColor, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    RoundedCard(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          for (var item in purchaseHistory.items)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item.title),
                                  Text('${item.totalPrice.toMoney()} تومان'),
                                ],
                              ),
                            ),
                          if (purchaseHistory.ticketDescription != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  const Icon(Icons.info_outlined, size: 20, color: MainColors.primaryColor),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${purchaseHistory.ticketDescription}',
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: GetPlatform.isAndroid ? 15 : 0),
              child: FilledRoundedButton(
                label: purchaseHistory.type == PurchaseType.ticket ? 'استرداد بلیط' : 'درخواست مرجوعی',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
