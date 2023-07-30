import 'package:fitness/models/hampa.dart';
import 'package:fitness/models/ticket.dart';
import 'package:fitness/screens/new_hampa.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:fitness/widgets/drop_down_menu.dart';
import 'package:fitness/widgets/hampa_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HampaScreen extends StatelessWidget {
  const HampaScreen();

  @override
  Widget build(BuildContext context) {
    var hampa = HampaModel(
      imageUrl: 'assets/images/avatar2.jpg',
      fullName: 'عماد فروغی',
      address: 'دروازه تهران',
      location: Location(32.6785, 51.6825),
      description: 'کسی پایه اس عصرها با هم بریم باشگاه؟؟',
    );

    return Scaffold(
      appBar: MyAppBar(
        title: 'همپا',
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 28),
            onPressed: () => Get.to(() => const NewHampaScreen()),
          )
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DropDownMenu(
                  items: const [
                    'جدید ترین',
                    'نزدیک ترین',
                  ],
                  onChange: () {},
                ),
                const Text(
                  'فیلتر',
                  style: TextStyle(color: MainColors.primaryColor, fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 20),
            HampaItem(hampa),
          ],
        ),
      ),
    );
  }
}
