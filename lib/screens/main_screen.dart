import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fitness/screens/activities_screen.dart';
import 'package:fitness/screens/alarm_screen.dart';
import 'package:fitness/screens/auth_screen.dart';
import 'package:fitness/screens/cart_screen.dart';
import 'package:fitness/screens/chat_list.dart';
import 'package:fitness/screens/club_screen.dart';
import 'package:fitness/screens/events_screen.dart';
import 'package:fitness/screens/hampa_screen.dart';
import 'package:fitness/screens/login_screen.dart';
import 'package:fitness/screens/music_screen.dart';
import 'package:fitness/screens/my_mentor.dart';
import 'package:fitness/screens/pages/expert_page.dart';
import 'package:fitness/screens/pages/home_page.dart';
import 'package:fitness/screens/pages/shop_page.dart';
import 'package:fitness/screens/pages/social_page.dart';
import 'package:fitness/screens/pages/training_page.dart';
import 'package:fitness/screens/profile.dart';
import 'package:fitness/screens/purchase_history_screen.dart';
import 'package:fitness/screens/signup_screen.dart';
import 'package:fitness/screens/start_screen.dart';
import 'package:fitness/screens/ticket_shop.dart';
import 'package:fitness/screens/verify_screen.dart';
import 'package:fitness/utils/string_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/bottom_nav_icon.dart';
import 'package:fitness/widgets/confirm_dialog.dart';
import 'package:fitness/widgets/drawer_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _key = GlobalKey<ScaffoldState>();
  var showHomePage = true;
  var selectedPage = 0;

  final pages = const <Widget>[
    ShopPage(),
    TrainingPage(),
    SocialPage(),
    ExpertPage(),
  ];

  final drawerItems = [
    DrawerItem(
      title: 'پروفایل',
      onTap: () => Get.to(() => const ProfileScreen()),
    ),
    DrawerItem(
      title: 'رویداد ها',
      onTap: () => Get.to(() => const EventsScreen()),
    ),
    DrawerItem(
      title: 'گیشه',
      onTap: () => Get.to(() => const TicketShop()),
    ),
    DrawerItem(
      title: 'آهنگ',
      onTap: () => Get.to(() => const MusicScreen()),
    ),
    DrawerItem(
      title: 'همپا',
      onTap: () => Get.to(() => const HampaScreen()),
    ),
    DrawerItem(
      title: 'یادآور',
      onTap: () => Get.to(() => const AlarmScreen()),
    ),
    DrawerItem(
      title: 'فعالیت ها',
      onTap: () => Get.to(() => const ActivitiesScreen()),
    ),
    DrawerItem(
      title: 'مربی من',
      onTap: () => Get.to(() => const MyMentor()),
    ),
    DrawerItem(
      title: 'سبد خرید (۱)',
      onTap: () => Get.to(() => const CartScreen()),
    ),
    DrawerItem(
      title: 'تاریخچه خرید',
      onTap: () => Get.to(() => const PurchaseHistoryScreen()),
    ),
    DrawerItem(
      title: 'باشگاه مشتریان',
      onTap: () => Get.to(() => const ClubScreen()),
    ),
    DrawerItem(
      title: 'آموزش های نشان شده',
      onTap: () {},
    ),
    DrawerItem(
      title: 'پشتیبانی',
      // isLast: true,
      onTap: () {},
    ),
    /// TODO: TEST ONLY. Remove these items in production
    DrawerItem(
      title: 'شروع (تست)',
      onTap: () => Get.to(() => const StartScreen()),
    ),
    DrawerItem(
      title: 'لاگین (تست)',
      onTap: () => Get.to(() => LoginScreen()),
    ),
    DrawerItem(
      title: 'ثبت نام (تست)',
      onTap: () => Get.to(() => const SignUpScreen()),
    ),
    DrawerItem(
      title: 'تایید موبایل (تست)',
      onTap: () => Get.to(() => const VerifyScreen()),
    ),
    DrawerItem(
      title: 'احراز هویت (تست)',
      onTap: () => Get.to(() => const AuthScreen()),
    ),
  ];

  final bottomIcons = [
    ['پروفایل', Icons.shopping_bag_outlined],
    ['آموزش', Icons.play_circle_outline],
    ['آهنگ', Icons.music_note_outlined],
    ['برنامه', Icons.self_improvement],
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return ConfirmDialog.show(
          context,
          buttonWidth: 80,
          title: 'خروج از برنامه',
          message:
              'آیا می خواهید از برنامه خارج شوید؟',
          confirm: 'خروج',
        );
      },
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.white,
        appBar: showHomePage
            ? AppBar(
                toolbarHeight: 55,
                leading: GestureDetector(
                  onTap: () {
                    _key.currentState?.openDrawer();
                  },
                  child: const Icon(Icons.menu, size: 30),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: () => Get.to(() => const ChatListScreen()),
                      child: const Icon(CupertinoIcons.chat_bubble_2, size: 30),
                    ),
                  ),
                ],
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: MainColors.primaryColor,
          splashColor: Colors.transparent,
          highlightElevation: 0,
          elevation: 0,
          child: const Icon(Icons.home, color: Colors.white),
          onPressed: () => setState(() => showHomePage = true),
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          tabBuilder: (index, active) {
            return BottomNavigationIcon(
              icon: bottomIcons[index][1] as IconData,
              label: bottomIcons[index][0] as String,
              isActive: !showHomePage && index == selectedPage,
            );
          },
          height: 70,
          itemCount: 4,
          activeIndex: selectedPage,
          gapLocation: GapLocation.center,
          backgroundColor: MainColors.grayLightest,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) => setState(() {
            selectedPage = index;
            showHomePage = false;
          }),
        ),
        drawer: Drawer(
          child: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage('assets/images/avatar1.jpg'),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      children: <Widget>[
                        const Text(
                          'حامد جعفرزاده',
                          style: TextStyle(
                            color: MainColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '0913 123 4567'.replaceWithPersianDigits(),
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(
                            color: MainColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Expanded(child: ListView(children: drawerItems)),
              ],
            ),
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 15),
          child: IndexedStack(
            index: showHomePage ? 4 : selectedPage,
            children: const [
              ProfileScreen(),
              TrainingPage(),
              ShopPage(),
              ExpertPage(),
              HomePage(),
            ],
          ),
        ),
      ),
    );
  }
}
