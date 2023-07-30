import 'package:fitness/models/chat.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/chat_item.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen();

  @override
  Widget build(BuildContext context) {
    var chats = [
      ChatModel(
        fullName: 'عماد فروغی',
        avatarUrl: 'assets/images/avatar2.jpg',
        messages: [
          MessageModel(
            content: 'سلام مرسی\nتو خوبی؟',
            timestamp: DateTime.now(),
            type: MessageType.outgoing,
          ),
        ],
      ),
      ChatModel(
        fullName: 'حامد جعفرزاده',
        avatarUrl: 'assets/images/avatar3.jpg',
        messages: [
          MessageModel(
            content: 'سلام مرسی\nتو خوبی؟',
            timestamp: DateTime.now().subtract(const Duration(hours: 25)),
            type: MessageType.outgoing,
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: MyAppBar(title: 'گفت و گو ها'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.separated(
          itemCount: chats.length,
          separatorBuilder: (context, i) {
            return const Divider(thickness: 2, height: 20, color: MainColors.grayLightest, indent: 80);
          },
          itemBuilder: (context, i) {
            return ChatItem(chats[i]);
          },
        ),
      ),
    );
  }
}
