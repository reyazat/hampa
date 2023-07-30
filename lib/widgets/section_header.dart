import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final void Function() onTapMore;

  const SectionHeader({required this.title, required this.onTapMore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: MainColors.grayDarkest),
          ),
          GestureDetector(
            onTap: onTapMore,
            child: const Text(
              'بیشتر',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: MainColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}