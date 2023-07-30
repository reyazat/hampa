import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';

class TrainingImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final void Function()? onTap;

  const TrainingImage({
    required this.imageUrl,
    this.height = 200,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    /// TODO: Replace with CachedNetworkImage
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}