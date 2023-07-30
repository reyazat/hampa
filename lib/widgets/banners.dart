import 'package:fitness/provider/music/music_provider.dart';
import 'package:fitness/screens/alarm_screen.dart';
import 'package:fitness/screens/hampa_screen.dart';
import 'package:fitness/screens/music_screen.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/rounded_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HampaBanner extends StatelessWidget {
  const HampaBanner();

  @override
  Widget build(BuildContext context) {
    return RoundedBanner(
      title: 'تنهایی ورزش نکن',
      image: Image.asset('assets/images/hampa_banner.png', height: 110),
      button: FilledRoundedButtonSm(
        label: 'یافتن همپا',
        width: 110,
        onTap: () => Get.to(() => const HampaScreen()),
      ),
    );
  }
}

class MusicBanner extends StatelessWidget {
  const MusicBanner();

  @override
  Widget build(BuildContext context) {
    return RoundedBanner(
      title: 'با آهنگ های پرانرژی\nورزش کن',
      image: Image.asset('assets/images/music_banner.png', height: 110),
      button: FilledRoundedButtonSm(
        label: 'لیست آهنگ ها',
        width: 130,
        onTap: () => Get.to(() => const MusicScreen()),
      ),
    );
  }
}

class AlarmBanner extends StatelessWidget {
  const AlarmBanner();

  @override
  Widget build(BuildContext context) {
    return RoundedBanner(
      title: 'برای ورزش کردن\nیادآور تنظیم کن',
      image: Image.asset('assets/images/running_banner.png', height: 130),
      button: FilledRoundedButtonSm(
        label: 'تنظیم یادآور',
        width: 130,
        onTap: () => Get.to(() => const AlarmScreen()),
      ),
    );
  }
}

class MentalHealthBanner extends StatelessWidget {
  const MentalHealthBanner();

  @override
  Widget build(BuildContext context) {
    return RoundedBanner(
      title: 'سلامت روان برات\nمهمه؟',
      button: const FilledRoundedButtonSm(label: 'تست سلامت روان', width: 140),
      image: Image.asset('assets/images/thinking_banner.png', height: 130),
    );
  }
}
