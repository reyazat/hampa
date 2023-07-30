import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  final double rating;
  final double size;
  final bool enabled;
  final void Function(double)? onRatingUpdate;

  const CustomRatingBar(this.rating, {this.size = 17, this.enabled = false, this.onRatingUpdate});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: !enabled,
      ignoreGestures: !enabled,
      itemCount: 5,
      unratedColor: MainColors.grayMid,
      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
      onRatingUpdate: onRatingUpdate ?? (_) {},
      itemSize: size,
    );
  }
}