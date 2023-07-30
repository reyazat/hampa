import 'package:flutter/material.dart';

class GradiantImage extends StatelessWidget {
  final String imageUrl;
  final Widget? label;
  final double? width;
  final double? height;
  final void Function()? onTap;

  const GradiantImage({
    required this.imageUrl,
    this.height = 200,
    this.width,
    this.label,
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
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.75),
                    ],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: label,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
