import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';

class RoundedBanner extends StatelessWidget {
  final String title;
  final Widget button;
  final Image image;

  const RoundedBanner({required this.title, required this.button, required this.image});

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      color: MainColors.primaryColor.withOpacity(0.1),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      color: MainColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 20),
                  button,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: image,
            ),
          )
        ],
      ),
    );
  }
}