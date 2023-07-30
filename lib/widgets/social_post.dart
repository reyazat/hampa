import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';

class SocialPost extends StatefulWidget {
  final bool liked;
  final String userFullName;
  final String userId;
  final String time;
  final String caption;
  final String imageUrl;
  final String avatarUrl;

  const SocialPost({
    required this.userFullName,
    required this.userId,
    required this.time,
    required this.liked,
    required this.caption,
    required this.imageUrl,
    required this.avatarUrl,
  });

  @override
  State<SocialPost> createState() => _SocialPostState();
}

class _SocialPostState extends State<SocialPost> {
  late bool liked;

  @override
  void initState() {
    liked = widget.liked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              /// TODO: Go to user's profile page
            },
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(widget.avatarUrl),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.userFullName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: MainColors.grayDarkest,
                      ),
                    ),
                    Text(
                      widget.time,
                      style: const TextStyle(
                        fontSize: 13,
                        color: MainColors.grayDarkest,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(widget.imageUrl, alignment: Alignment.topCenter),
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: handleLikeButtonTap,
                child: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: liked ? MainColors.primaryColor : MainColors.grayDarkest,
                  size: 26,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                child: const Icon(Icons.chat_bubble_outline, color: MainColors.grayDarkest),
              ),
              const Expanded(child: SizedBox()),
              GestureDetector(
                child: const Icon(Icons.report_outlined, color: MainColors.grayDarkest),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(widget.caption, style: const TextStyle(color: MainColors.grayDarkest)),
        ],
      ),
    );
  }

  void handleLikeButtonTap() {
    setState(() {
      liked = !liked;
    });
    /// TODO: Show animation after liking post (like Instagram)
  }
}
