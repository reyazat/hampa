import 'package:fitness/utils/num_api.dart';
import 'package:flutter/material.dart';
import 'package:fitness/models/club_reward.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/ribbon.dart';
import 'package:fitness/values/colors.dart';

class ClubRewardItem extends StatelessWidget {
  final ClubRewardModel reward;

  const ClubRewardItem(this.reward);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        RoundedCard(
          color: reward.canAcquire ? MainColors.primaryColor.withOpacity(0.1) : null,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 15),
                child: Text(
                  '${reward.discount}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 36,
                    color: MainColors.grayDarkest,
                  ),
                ),
              ),
              Text(
                reward.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: MainColors.grayDarkest,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              if (reward.canAcquire) const FilledRoundedButtonSm(label: 'دریافت جایزه'),
            ],
          ),
        ),
        Ribbon(
          title: '${reward.requiredPoints.toFaString()} امتیاز',
          backgroundColor: MainColors.primaryColor,
        ),
      ],
    );
  }
}
