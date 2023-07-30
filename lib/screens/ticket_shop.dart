import 'package:fitness/models/ticket.dart';
import 'package:fitness/screens/ticket_details.dart';
import 'package:fitness/utils/num_api.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/custom_rating_bar.dart';
import 'package:fitness/widgets/gradient_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketShop extends StatelessWidget {
  const TicketShop();

  @override
  Widget build(BuildContext context) {
    var ticket = TicketModel(
      id: 1,
      price: 25000,
      rating: 4,
      title: 'استخر انقلاب',
      imageUrl: 'assets/images/pool.jpg',
      address: 'اصفهان، میدان انقلاب، جنب زاینده رود',
      phone: '+9893512345678',
      location: Location(32.6785, 51.6825),
      description:
          'مجموعه فرهنگي ورزشي انقلاب : مجموعه ماندگار استخر بانوان مجموعه مورخ 8/4/1390 موردافتتاح و بهره برداری قرار گرفت. این پروژه به مساحت (5000) مترمربع و با اعتباری بالغ بردو میلیارد و سيصد ميليون تومان از محل اعتبارات سازمان تربیت بدنی و به کارفرمایی مجموعه فرهنگي ورزشي انقلاب ، شرکت توسعه و نگهداری اماکن ورزشی ساخته شد.',
      amenities: [
        'سونا',
        'کافی شاپ',
        'جکوزی',
        'رستوران',
      ],
    );

    return Scaffold(
      appBar: MyAppBar(title: 'گیشه بلیط'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            GradiantImage(
              imageUrl: ticket.imageUrl,
              onTap: () => Get.to(() => TicketDetailsScreen(ticket)),
              label: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ticket.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomRatingBar(ticket.rating),
                      ],
                    ),
                    Text(
                      '${ticket.price.toMoney()} تومان',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
