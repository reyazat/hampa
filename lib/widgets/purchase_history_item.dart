import 'package:fitness/models/purchase_history.dart';
import 'package:fitness/screens/purchase_details.dart';
import 'package:fitness/utils/jalali_api.dart';
import 'package:fitness/utils/num_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamsi_date/shamsi_date.dart';

class PurchaseHistoryItem extends StatelessWidget {
  final PurchaseHistoryModel purchaseHistory;
  final Jalali jDate;

  PurchaseHistoryItem(this.purchaseHistory) : jDate = Jalali.fromDateTime(purchaseHistory.dateTime);

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      onTap: () => Get.to(() => PurchaseDetails(purchaseHistory)),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Shabnam',
          fontWeight: FontWeight.w600,
          color: MainColors.grayDarkest,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                purchaseHistory.items.map((p) => p.title).join('، '),
                textAlign: TextAlign.start,
                softWrap: false,
              ),
            ),
            const Divider(color: Colors.white, thickness: 2, height: 10),
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
                  const Text('کد پیگیری'),
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
    );
  }
}
