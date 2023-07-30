import 'package:fitness/screens/friends_screen.dart';
import 'package:fitness/screens/new_post.dart';
import 'package:fitness/widgets/banners.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/social_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialPage extends StatelessWidget {
  const SocialPage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 20),
        const HampaBanner(),
        const SizedBox(height: 15),

        /// TODO: Use flutter slivers to make these button stick at top when scrolling
        Row(
          children: <Widget>[
            Expanded(
              child: OutlinedRoundedButtonSm(
                label: 'پست جدید',
                icon: Icons.add,
                onTap: () => Get.to(() => const NewPostScreen()),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: OutlinedRoundedButtonSm(
                label: 'لیست دوستان',
                icon: Icons.list,
                onTap: () => Get.to(() => const FriendsScreen()),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return const SocialPost(
                userFullName: 'عماد فروغی',
                userId: 'emad_f_2020',
                time: '۲۰ مهر',
                liked: false,
                caption: 'یه روز خوب با ورزش در خانه :)))',
                imageUrl: 'assets/images/exercise.jpg',
                avatarUrl: 'assets/images/avatar1.jpg',
              );
            },
          ),
        ),
      ],
    );
  }
}
