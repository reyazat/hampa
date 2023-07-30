import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness/screens/activities_screen.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/banners.dart';
import 'package:fitness/widgets/gradient_image.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:fitness/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SectionHeader(
          title: 'فعالیت شما',
          onTapMore: () => Get.to(() => const ActivitiesScreen()),
        ),
        RoundedCard(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: DefaultTextStyle(
              style: const TextStyle(
                color: MainColors.primaryColor,
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w600,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: const [
                          Text('قدم ها '),
                          Icon(
                            Icons.directions_walk,
                            color: MainColors.primaryColor,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text('1350', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                    ],
                  ),
                  Container(color: MainColors.grayLight, width: 2, height: 40),
                  Column(
                    children: <Widget>[
                      Row(
                        children: const [
                          Text('کالری '),
                          Icon(
                            Icons.local_fire_department,
                            color: MainColors.primaryColor,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text('1350 Cal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                    ],
                  ),
                  Container(color: MainColors.grayLight, width: 2, height: 40),
                  Column(
                    children: <Widget>[
                      Row(
                        children: [
                          const Text('مسافت '),
                          Transform.rotate(
                            angle: pi / 2,
                            child: const Icon(Icons.height, color: MainColors.primaryColor, size: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text('13 km', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SectionHeader(title: 'آموزش های برتر', onTapMore: () {}),
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.9,
            enableInfiniteScroll: false,
            height: 200,
            padEnds: false,
          ),
          items: ['assets/images/train1.jpg', 'assets/images/train3.jpg'].map((i) {
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: GradiantImage(
                imageUrl: i,
                label: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        'آموزش بدنسازی',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '۳۰ دقیقه',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 15),
        const MusicBanner(),
        const SizedBox(height: 5),
        SectionHeader(title: 'برنامه های پر فروش', onTapMore: () {}),
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.9,
            enableInfiniteScroll: false,
            height: 200,
            padEnds: false,
          ),
          items: ['assets/images/workout-plan1.jpg', 'assets/images/workout-plan2.jpg'].map((i) {
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: GradiantImage(
                imageUrl: i,
                label: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        'آموزش بدنسازی',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '۳۰ دقیقه',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
