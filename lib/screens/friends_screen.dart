import 'package:fitness/models/people.dart';
import 'package:fitness/screens/search_friends.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/people_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen();

  @override
  Widget build(BuildContext context) {
    var friends = [
      PeopleModel(
        fullName: 'عماد فروغی',
        username: '@emad2020',
        imageUrl: 'avatar2.jpg',
        status: FriendshipStatus.pending,
      ),
      PeopleModel(
        fullName: 'عماد فروغی',
        username: '@emad2020',
        imageUrl: 'avatar3.jpg',
        status: FriendshipStatus.isFriend,
      ),
      PeopleModel(
        fullName: 'عماد فروغی',
        username: '@emad2020',
        imageUrl: 'avatar4.jpg',
        status: FriendshipStatus.isFriend,
      ),
    ];

    return Scaffold(
      appBar: MyAppBar(
        title: 'دوستان',
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            onPressed: () => Get.to(() => const SearchFriendsScreen()),
            icon: const Icon(Icons.search, size: 30),
          )
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: const <Widget>[
                Icon(
                  Icons.contacts_outlined,
                  color: MainColors.primaryColor,
                ),
                SizedBox(width: 5),
                Text(
                  'افزودن دوست از مخاطبین',
                  style: TextStyle(fontWeight: FontWeight.w600, color: MainColors.primaryColor, fontSize: 16),
                ),
              ],
            ),
            if (friends.any((friend) => friend.status == FriendshipStatus.pending)) ...[
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 5),
                child: Text(
                  '۱ درخواست دوستی',
                  style: TextStyle(fontWeight: FontWeight.w600, color: MainColors.grayDarkest, fontSize: 16),
                ),
              ),
              for (var friend in friends.where((f) => f.status == FriendshipStatus.pending))
                PeopleItem(friend),
              const Divider(thickness: 2, height: 0, color: MainColors.grayLightest),
            ],
            for (var friend in friends.where((f) => f.status == FriendshipStatus.isFriend))
              PeopleItem(friend),
          ],
        ),
      ),
    );
  }
}
