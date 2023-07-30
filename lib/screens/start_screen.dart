import 'package:fitness/screens/login_screen.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  const StartScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  const ColorBall(200, left: 90, top: 60),
                  const ColorBall(50, left: 20, top: 250),
                  const ColorBall(220, left: 10, bottom: 120),
                  const ColorBall(150, right: 30, bottom: 60),
                  const ColorBall(40, right: 20, bottom: 350),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/start.png', height: 500),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: GetPlatform.isAndroid ? 20 : 0),
              child: const FilledRoundedButton(
                label: 'ورود | ثبت نام',
                // onTap: () => Get.to(() => const LoginScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorBall extends StatelessWidget {
  final double radius;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const ColorBall(
    this.radius, {
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      height: radius,
      width: radius,
      child: Container(
        height: radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: MainColors.primaryColor.withOpacity(0.1),
        ),
      ),
    );
  }
}
