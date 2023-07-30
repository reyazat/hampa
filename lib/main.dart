import 'package:bot_toast/bot_toast.dart';
import 'package:fitness/provider/auth_provider.dart';
import 'package:fitness/provider/music/music_provider.dart';
import 'package:fitness/screens/login_screen.dart';
import 'package:fitness/screens/main_screen.dart';
import 'package:fitness/screens/pages/home_page.dart';
import 'package:fitness/screens/start_screen.dart';
import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<MusicProvider>(create: (_) => MusicProvider()),
      ],
        child: Phoenix(child: const FitnessApp())
      ),
  );
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(
        fontFamily: 'Shabnam',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          centerTitle: true,
          actionsIconTheme: IconThemeData(color: MainColors.grayDarkest),
          iconTheme: IconThemeData(color: MainColors.grayDarkest, size: 20),
          titleTextStyle: TextStyle(
            color: MainColors.grayDarkest,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Shabnam'
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: MainColors.grayLightest,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
        ),
      ),
      locale: const Locale('fa'),
      // home: const StartScreen(),
      home: MainScreen(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
      },
    );
  }
}
