import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/custom_rating_bar.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';

class ExpertItem extends StatelessWidget {
  final String avatarUrl;
  final String fullName;
  final String userId;
  final String price;
  final double rating;

  const ExpertItem({
    required this.fullName,
    required this.avatarUrl,
    required this.price,
    required this.userId,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// TODO: Go to expert details screen
      },
      child: RoundedCard(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(avatarUrl),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullName,
                  style: const TextStyle(
                    color: MainColors.grayDarkest,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                CustomRatingBar(rating),
                const SizedBox(height: 5),
                Text(
                  'از $price تومان',
                  style: const TextStyle(
                    color: MainColors.grayDarkest,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
