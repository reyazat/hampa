import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';

class FilledRoundedButton extends StatelessWidget {

  final double? width;
  final double height;
  final double fontSize;
  final String label;
  final void Function()? onTap;

  const FilledRoundedButton({
    required this.label,
    this.width,
    this.height = 50,
    this.fontSize = 20,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: MainColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}

class FilledRoundedButtonSm extends StatelessWidget {
  final double? width;
  final String label;
  final void Function()? onTap;

  const FilledRoundedButtonSm({required this.label, this.width, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FilledRoundedButton(label: label, onTap: onTap, width: width, height: 35, fontSize: 16);
  }
}

class OutlinedRoundedButton extends StatelessWidget {
  final double? width;
  final double height;
  final double fontSize;
  final double borderWidth;
  final String label;
  final IconData? icon;
  final void Function()? onTap;

  const OutlinedRoundedButton({
    required this.label,
    this.width,
    this.height = 50,
    this.fontSize = 20,
    this.borderWidth = 3,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: borderWidth, color: MainColors.primaryColor),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[Icon(icon, color: MainColors.primaryColor), const SizedBox(width: 5)],
              Text(
                label,
                style: TextStyle(
                  color: MainColors.primaryColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OutlinedRoundedButtonSm extends StatelessWidget {
  final String label;
  final double? width;
  final IconData? icon;
  final void Function()? onTap;

  const OutlinedRoundedButtonSm({required this.label, this.width, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return OutlinedRoundedButton(
      label: label,
      onTap: onTap,
      width: width,
      icon: icon,
      height: 35,
      fontSize: 16,
      borderWidth: 2,
    );
  }
}
