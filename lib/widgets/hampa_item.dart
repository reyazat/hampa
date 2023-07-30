import 'package:flutter/material.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/screens/hampa_details.dart';
import 'package:fitness/models/hampa.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:get/get.dart';

class HampaItem extends StatelessWidget {
  final HampaModel hampa;

  const HampaItem(this.hampa);

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      onTap: () => Get.to(() => HampaDetails(hampa)),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(hampa.imageUrl),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  hampa.description,
                  style: const TextStyle(fontSize: 15, color: MainColors.grayDarkest),
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
          ),
        ],
      ),
    );
  }
}