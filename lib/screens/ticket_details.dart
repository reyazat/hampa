import 'package:fitness/models/ticket.dart';
import 'package:fitness/screens/comments_screen.dart';
import 'package:fitness/screens/ticket_book.dart';
import 'package:fitness/utils/num_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/custom_rating_bar.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TicketDetailsScreen extends StatelessWidget {
  final TicketModel ticket;

  const TicketDetailsScreen(this.ticket);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: ticket.title),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(ticket.imageUrl, height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      '${ticket.price.toMoney()} تومان',
                      style: const TextStyle(
                          color: MainColors.grayDarkest, fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    FilledRoundedButtonSm(
                      label: 'خرید بلیط',
                      onTap: () => Get.to(() => const TicketBookScreen()),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    CustomRatingBar(ticket.rating),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () => Get.to(() => const CommentsScreen()),
                      child: const Text(
                        'مشاهده نظرات',
                        style: TextStyle(
                          color: MainColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                ticket.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16, color: MainColors.grayDarkest),
              ),
            ),
            Row(
              children: const <Widget>[
                Icon(Icons.verified_outlined, color: MainColors.primaryColor),
                SizedBox(width: 5),
                Text(
                  'امکانات',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: MainColors.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            RoundedCard(
              padding: const EdgeInsets.all(10),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w600,
                  color: MainColors.primaryColor,
                  fontSize: 16,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: ticket.amenities.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5,
                  ),
                  itemBuilder: (context, index) {
                    return Text('\u{2022} ${ticket.amenities[index]}');
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: const <Widget>[
                Icon(Icons.room_outlined, color: MainColors.primaryColor),
                SizedBox(width: 5),
                Text(
                  'نشانی',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: MainColors.primaryColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                ticket.address,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: MainColors.grayDarkest,
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                OutlinedRoundedButtonSm(
                  label: 'تماس',
                  width: 100,
                  onTap: () async {
                    if (await canLaunchUrlString(ticket.phone)) {
                      launchUrlString(ticket.phone);
                    }
                  },
                ),
                const SizedBox(width: 10),
                OutlinedRoundedButtonSm(
                  label: 'مسیریابی',
                  width: 100,
                  onTap: () async {
                    var googleUrl = 'comgooglemaps://?center=${ticket.location.lat},${ticket.location.long}';
                    var appleUrl =
                        'https://maps.apple.com/?sll=${ticket.location.lat},${ticket.location.long}';
                    if (await canLaunchUrlString(GetPlatform.isAndroid ? googleUrl : appleUrl)) {
                      launchUrlString(GetPlatform.isAndroid ? googleUrl : appleUrl);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
