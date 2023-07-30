import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final Color? color;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final void Function()? onTap;

  const RoundedCard({required this.child, this.color, this.padding, this.margin, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: color ?? MainColors.grayLightest,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
