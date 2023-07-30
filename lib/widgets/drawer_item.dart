import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final bool isLast;

  const DrawerItem({required this.title, required this.onTap, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Text(
            title,
            style: const TextStyle(color: MainColors.grayDarkest, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        if (!isLast) const Divider(thickness: 2, color: MainColors.grayLightest, height: 20),
      ],
    );
  }
}