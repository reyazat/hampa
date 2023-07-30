import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/utils/string_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';

class MusicItem extends StatelessWidget {

  final String name;
  final String duration;
  final String? cover;
  final IconData favoriteIcon;
  final void Function()? onTapFavorite;
  final void Function()? onTapPlay;

  const MusicItem({
    required this.name,
    required this.duration,
    this.cover,
    required this.favoriteIcon,
    this.onTapFavorite,
    this.onTapPlay,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: onTapPlay,
            child: const Icon(
              Icons.play_circle_outlined,
              color: MainColors.primaryColor,
              size: 35,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onTapFavorite,
            child: Icon(favoriteIcon,
              color: MainColors.primaryColor,
              size: 30,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Marquee(
                  textDirection : TextDirection.ltr,
                  animationDuration: const Duration(seconds: 10),
                  backDuration: const Duration(milliseconds: 5000),
                  pauseDuration: const Duration(milliseconds: 3000),
                  child:Text( name.replaceWithPersianDigits(),style:const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: MainColors.grayDarkest,
                  ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(duration.substring(0,4).replaceWithPersianDigits(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: MainColors.grayDarkest,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          (cover!.isNotEmpty)?
          CachedNetworkImage(
            imageUrl: cover!,
            imageBuilder: (context, imageProvider) =>
                CircleAvatar(
                  radius: 35,
                  backgroundImage: imageProvider,
                ),
            placeholder: (context, url) => _circleBox(context, const CircularProgressIndicator()),
            errorWidget: (context, url, error) => _circleBox(context, const Icon(Icons.error)),
          )
              : const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/music_avatar.jpg'),
          ),

        ],
      ),
    );
  }

  _circleBox(context, child) {
    return CircleAvatar(
      radius: 35,
      child: child,
      backgroundColor: MainColors.grayLightest,
    );
  }
}