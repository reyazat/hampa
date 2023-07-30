import 'package:fitness/models/people.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/people_item.dart';
import 'package:fitness/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class SearchFriendsScreen extends StatelessWidget {
  const SearchFriendsScreen();

  @override
  Widget build(BuildContext context) {
    var people = PeopleModel(
      fullName: 'عماد فروغی',
      username: '@emad2020',
      imageUrl: 'avatar4.jpg',
      status: FriendshipStatus.notFriend,
    );

    return Scaffold(
      appBar: MyAppBar(title: 'جستجو'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            RoundedTextField(hint: 'نام کاربری'),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  PeopleItem(people),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
