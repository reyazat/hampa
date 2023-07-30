import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/custom_rating_bar.dart';
import 'package:fitness/widgets/expert_item.dart';
import 'package:fitness/widgets/gradient_image.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:fitness/widgets/section_header.dart';
import 'package:flutter/material.dart';

class ExpertPage extends StatelessWidget {
  const ExpertPage();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            enableInfiniteScroll: false,
            height: 200,
          ),
          items: [
            GradiantImage(
              imageUrl: 'assets/images/mentor1.jpg',
              label: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'حامد جعفرزاده',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        CustomRatingBar(4),
                      ],
                    ),
                    const Text(
                      '۵۳ ورزشکار',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            GradiantImage(
              imageUrl: 'assets/images/mentor2.jpg',
              label: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'حامد جعفرزاده',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        CustomRatingBar(4),
                      ],
                    ),
                    const Text(
                      '۵۳ ورزشکار',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        RoundedCard(
          color: MainColors.primaryColor.withOpacity(0.1),
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                children: const [
                  Text(
                    'مربی من',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: MainColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/avatar2.jpg'),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'حامد جعفرزاده',
                    style: TextStyle(
                      fontSize: 16,
                      color: MainColors.grayDarkest,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const <Widget>[
                      OutlinedRoundedButtonSm(label: 'برنامه ورزشی'),
                      SizedBox(width: 10),
                      OutlinedRoundedButtonSm(label: 'چت با مربی')
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SectionHeader(title: 'مربیان بدنسازی', onTapMore: () {}),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const <Widget>[
              ExpertItem(
                fullName: 'حامد جعفرزاده',
                avatarUrl: 'assets/images/avatar3.jpg',
                userId: 'expert10',
                price: '۲۵۰,۰۰۰',
                rating: 4.5,
              ),
              ExpertItem(
                fullName: 'حامد جعفرزاده',
                avatarUrl: 'assets/images/avatar2.jpg',
                userId: 'expert10',
                price: '۲۵۰,۰۰۰',
                rating: 4,
              ),
            ],
          ),
        ),
        SectionHeader(title: 'متخصصان تغذیه', onTapMore: () {}),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const <Widget>[
              ExpertItem(
                fullName: 'حامد جعفرزاده',
                avatarUrl: 'assets/images/avatar1.jpg',
                userId: 'expert10',
                price: '۲۵۰,۰۰۰',
                rating: 4.5,
              ),
              ExpertItem(
                fullName: 'حامد جعفرزاده',
                avatarUrl: 'assets/images/avatar2.jpg',
                userId: 'expert10',
                price: '۲۵۰,۰۰۰',
                rating: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
