import 'package:fitness/models/people.dart';
import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';

class PeopleItem extends StatelessWidget {
  final PeopleModel friend;

  const PeopleItem(this.friend);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: IconTheme(
        data: const IconThemeData(color: MainColors.primaryColor, size: 27),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/${friend.imageUrl}'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    friend.fullName,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      color: MainColors.grayDarkest,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(friend.username, style: const TextStyle(color: MainColors.grayDarkest)),
                ],
              ),
            ),
            const SizedBox(width: 10),
            if (friend.status == FriendshipStatus.pending) ...[
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.close),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.check_circle_outline_outlined),
              ),
            ],
            if (friend.status == FriendshipStatus.isFriend) ...[
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.chat_outlined),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.person_remove),
              ),
            ],
            if (friend.status == FriendshipStatus.notFriend)
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.person_add),
              ),
          ],
        ),
      ),
    );
  }
}
