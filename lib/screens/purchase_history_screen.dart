import 'package:fitness/models/purchase_history.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/purchase_history_item.dart';
import 'package:fitness/widgets/toggle_button.dart';
import 'package:flutter/material.dart';

class PurchaseHistoryScreen extends StatefulWidget {
  const PurchaseHistoryScreen();

  @override
  State<PurchaseHistoryScreen> createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  var selectedType = 0;

  var purchases = [
    PurchaseHistoryModel(
      totalPrice: 480000,
      dateTime: DateTime.now(),
      type: PurchaseType.product,
      transactionId: '546548435468486468',
      status: PurchaseStatus.posted,
      deliveryCost: 30000,
      items: [
        PurchaseItemModel(title: 'کفش Nike', totalPrice: 150000),
        PurchaseItemModel(title: 'دمبل', totalPrice: 250000),
        PurchaseItemModel(title: 'مکمل بدنسازی', totalPrice: 50000),
      ],
    ),
    PurchaseHistoryModel(
      totalPrice: 50000,
      dateTime: DateTime.now(),
      type: PurchaseType.ticket,
      transactionId: '546548435468486468',
      ticketDescription: 'سانس آقایان | ساعت ۱۴ - ۱۶',
      items: [PurchaseItemModel(title: 'بلیط استخر انقلاب', totalPrice: 50000)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'تاریخچه خرید'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ToggleButton(
              items: const ['فروشگاه', 'گیشه'],
              onChange: (i) {
                setState(() {
                  selectedType = i;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: <Widget>[
                  for (var historyItem in purchases.where((p) {
                    if (selectedType == 0) {
                      return p.type == PurchaseType.product;
                    }
                    return p.type == PurchaseType.ticket;
                  }))
                    PurchaseHistoryItem(historyItem),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
