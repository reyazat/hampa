import 'package:fitness/utils/jalali_api.dart';
import 'package:flutter/material.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/models/chat.dart';
import 'package:shamsi_date/shamsi_date.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;
  final Jalali jDate;

  ChatBubble(this.message) : jDate = Jalali.fromDateTime(message.timestamp);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(
        left: message.type == MessageType.outgoing ? 60 : 0,
        right: message.type == MessageType.incoming ? 60 : 0,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: message.type == MessageType.outgoing
            ? MainColors.grayLightest
            : MainColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(15),
          topRight: const Radius.circular(15),
          bottomLeft: message.type == MessageType.outgoing ? const Radius.circular(15) : Radius.zero,
          bottomRight: message.type == MessageType.incoming ? const Radius.circular(15) : Radius.zero,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            message.content,
            style: const TextStyle(fontWeight: FontWeight.w600, color: MainColors.grayDarkest, fontSize: 15),
          ),
          const SizedBox(height: 5),
          Text(
            jDate.toTimeString(),
            style: const TextStyle(fontSize: 13, color: MainColors.grayDarkest),
          ),
        ],
      ),
    );
  }
}
