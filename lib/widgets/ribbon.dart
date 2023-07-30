import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';

class Ribbon extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final Color? backgroundColor;

  const Ribbon({required this.title, this.width = 100, this.height = 30, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? MainColors.primaryColor.withOpacity(0.8),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}
