import 'package:fitness/models/club_reward.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/club_reward_item.dart';
import 'package:fitness/widgets/info.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ClubScreen extends StatelessWidget {
  const ClubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rewards = [
      ClubRewardModel(
        canAcquire: true,
        discount: 10,
        description: 'تخفیف خرید تجهیزات ورزشی',
        requiredPoints: 350,
      ),
      ClubRewardModel(
        canAcquire: true,
        discount: 30,
        description: 'تخفیف خرید مکمل های ورزشی',
        requiredPoints: 350,
      ),
      ClubRewardModel(
        canAcquire: false,
        discount: 50,
        description: 'تخفیف خرید بلیط استخر',
        requiredPoints: 450,
      ),
      ClubRewardModel(
        canAcquire: false,
        discount: 25,
        description: 'تخفیف مربی خصوصی',
        requiredPoints: 650,
      ),
    ];

    return Scaffold(
      appBar: MyAppBar(title: 'باشگاه مشتریان'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            RoundedCard(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: const <Widget>[
                  Icon(Icons.emoji_events, color: MainColors.primaryColor, size: 30),
                  Expanded(
                    child: Text(
                      ' امتیاز شما',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: MainColors.primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    '۴۳۰',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: MainColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const Info(
              'نحوه محاسبه امتیاز',
              description: 'شما می توانید با پیاده روی و یا مشاهده فیلم های آموزشی امتیاز کسب کنید.',
            ),
            const SizedBox(height: 20),
            Expanded(
              child: MasonryGridView.count(
                itemCount: rewards.length,
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                itemBuilder: (context, i) {
                  return ClubRewardItem(rewards[i]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
