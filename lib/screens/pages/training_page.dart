import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness/models/training.dart';
import 'package:fitness/screens/training_details.dart';
import 'package:fitness/utils/num_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/bottom_nav_icon.dart';
import 'package:fitness/widgets/drop_down_menu.dart';
import 'package:fitness/widgets/gradient_image.dart';
import 'package:fitness/widgets/section_header_channels.dart';
import 'package:fitness/widgets/training_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage();

  @override
  Widget build(BuildContext context) {
    /// TODO: Remove this after connecting app to REST api
    var trainingModel = TrainingModel(
      'آموزش رول شکم',
      'حامد جعفرزاده',
      'یکی از ساده‌ترین روش تمرین دادن شکم ، دست و پا استفاده از چرخ تمرین شکم است. امروزه رولر تناسب اندام یا چرخ تمرین شکم یکی از لوازم ورزشی بسیار مفید در تناسب اندام و تقویت عضلات ماهیچه شکم پشت بازوها و شانه ها و حتی پا می‌باشد.',
      'assets/images/train1.jpg',
      '',
      30,
    );

    return Column(
      children: <Widget>[
        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 33),
                child: BottomNavigationIcon(label: 'همه', icon: Icons.grid_view, isActive: true),
              ),
              Padding(
                padding: EdgeInsets.only(left: 33),
                child: BottomNavigationIcon(label: 'عمومی', icon: Icons.fitness_center),
              ),
              Padding(
                padding: EdgeInsets.only(left: 33),
                child: BottomNavigationIcon(label: 'کودکان', icon: Icons.directions_run),
              ),
              Padding(
                padding: EdgeInsets.only(left: 33),
                child: BottomNavigationIcon(label: 'زنان باردار', icon: Icons.self_improvement),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0),
                child: BottomNavigationIcon(label: 'سالمندان', icon: Icons.elderly),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DropDownMenu(
              items: const [
                'جدید ترین',
                'محبوب ترین',
                'آسان ترین',
              ],
              onChange: () {},
            ),
            const Text(
              'فیلتر',
              style: TextStyle(color: MainColors.primaryColor, fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
              child: Column(
                children: [
                  SectionHeaderChannels(
                      title: 'تیم بادی پروجکت',
                      subTitle: 'ویژه ورزش در خانه',
                      onTapMore: () {}
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 0.6,
                      enableInfiniteScroll: false,
                      height: 190,
                      padEnds: false,
                    ),
                    items: ['assets/images/train1.jpg', 'assets/images/train3.jpg'].map((i) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            TrainingImage(
                              imageUrl: i,
                              height: 145,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: const [
                                Text('تمرینات خانگی با جکس',
                                  // textAlign: TextAlign.right,
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: MainColors.grayDarkest),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: const [
                                Text('24 ویدئو تمرینی',
                                  // textAlign: TextAlign.right,
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11, color: MainColors.grayDarkest),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  SectionHeaderChannels(
                      title: 'تیم بادی پروجکت',
                      subTitle: 'ویژه ورزش در خانه',
                      onTapMore: () {}
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 0.6,
                      enableInfiniteScroll: false,
                      height: 190,
                      padEnds: false,
                    ),
                    items: ['assets/images/train1.jpg', 'assets/images/train3.jpg'].map((i) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            TrainingImage(
                              imageUrl: i,
                              height: 145,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: const [
                                Text('تمرینات خانگی با جکس',
                                  // textAlign: TextAlign.right,
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: MainColors.grayDarkest),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: const [
                                Text('24 ویدئو تمرینی',
                                  // textAlign: TextAlign.right,
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11, color: MainColors.grayDarkest),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  SectionHeaderChannels(
                      title: 'تیم بادی پروجکت',
                      subTitle: 'ویژه ورزش در خانه',
                      onTapMore: () {}
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 0.6,
                      enableInfiniteScroll: false,
                      height: 190,
                      padEnds: false,
                    ),
                    items: ['assets/images/train1.jpg', 'assets/images/train3.jpg'].map((i) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            TrainingImage(
                              imageUrl: i,
                              height: 145,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: const [
                                Text('تمرینات خانگی با جکس',
                                  // textAlign: TextAlign.right,
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: MainColors.grayDarkest),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: const [
                                Text('24 ویدئو تمرینی',
                                  // textAlign: TextAlign.right,
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11, color: MainColors.grayDarkest),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
          ),
        ),
      ],
    );
  }
}
