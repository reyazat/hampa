import 'package:flutter/material.dart';
import 'package:fitness/values/colors.dart';

class BottomNavigationIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;

  const BottomNavigationIcon({required this.label, required this.icon, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: isActive ? MainColors.primaryColor : MainColors.grayDarkest,
            size: 30,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isActive ? MainColors.primaryColor : MainColors.grayDarkest,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}