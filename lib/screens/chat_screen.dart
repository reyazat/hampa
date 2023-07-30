import 'package:fitness/models/chat.dart';
import 'package:fitness/utils/jalali_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/chat_bubble.dart';
import 'package:fitness/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamsi_date/shamsi_date.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen();

  @override
  Widget build(BuildContext context) {
    var chat = ChatModel(
      fullName: 'عماد فروغی',
      lastSeen: 'آنلاین',
      avatarUrl: 'assets/images/avatar2.jpg',
      messages: [
        MessageModel(
          content: 'سلام\nچطوری؟\nحالت خوبه؟',
          timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 1)),
          seen: true,
          type: MessageType.outgoing,
        ),
        MessageModel(
          content: 'سلام مرسی\nتو خوبی؟',
          timestamp: DateTime.now().subtract(const Duration(days: 1)),
          type: MessageType.incoming,
        ),
        MessageModel(
          content: 'خوبم ممنون\nامروز میتونی بیای بیرون؟',
          timestamp: DateTime.now(),
          type: MessageType.outgoing,
        ),
      ],
    );
    chat.messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 30,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.arrow_back_ios_sharp),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
        title: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(chat.avatarUrl),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  chat.fullName,
                  style: const TextStyle(
                    fontSize: 16,
                    color: MainColors.grayDarkest,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(chat.lastSeen, style: const TextStyle(fontSize: 13, color: MainColors.grayDarkest)),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                reverse: true,
                children: buildChatBubbles(chat.messages),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: RoundedTextField(hint: 'متن پیام', maxLines: null)),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Icon(Icons.send, color: MainColors.primaryColor, size: 30),
                  ),
                ),
              ],
            ),
            if (GetPlatform.isAndroid) const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  List<Widget> buildChatBubbles(List<MessageModel> messages) {
    var bubbles = <Widget>[];
    var previousMsgTime = messages.first.timestamp;

    for (var message in messages) {
      if (previousMsgTime.difference(message.timestamp).inDays > 0) {
        bubbles.add(buildDaySeparator(Jalali.fromDateTime(previousMsgTime).toDateString()));
      }
      previousMsgTime = message.timestamp;
      bubbles.add(ChatBubble(message));
    }
    bubbles.add(buildDaySeparator(Jalali.fromDateTime(previousMsgTime).toDateString()));

    return bubbles;
  }

  Widget buildDaySeparator(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        date,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w600, color: MainColors.primaryColor),
      ),
    );
  }
}
