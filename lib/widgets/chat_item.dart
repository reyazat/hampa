import 'package:fitness/utils/jalali_api.dart';
import 'package:flutter/material.dart';
import 'package:fitness/models/chat.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/screens/chat_screen.dart';
import 'package:get/get.dart';
import 'package:shamsi_date/shamsi_date.dart';

class ChatItem extends StatelessWidget {
  final ChatModel chat;
  final Jalali jDate;

  ChatItem(this.chat) : jDate = Jalali.fromDateTime(chat.messages.last.timestamp);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Get.to(() => const ChatScreen()),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(chat.avatarUrl),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        chat.fullName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: MainColors.grayDarkest,
                        ),
                      ),
                    ),
                    Text(
                        DateTime.now().difference(chat.messages.last.timestamp).inDays > 0
                          ? jDate.toDateString()
                          : jDate.toTimeString(),
                      style: const TextStyle(color: MainColors.grayDarkest),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  chat.messages.isNotEmpty ? chat.messages.last.content.replaceAll('\n', ' ') : '',
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: MainColors.grayDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
