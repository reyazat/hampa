import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fitness/helpers/auth_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/services/logger_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class FirebaseMessagingService {

  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp().whenComplete(() async {
      debugPrint("Main Handling a background message: ${message.messageId}");
      debugPrint("Main Handling a background message: ${message.data}");

    }).catchError((e) {
      LoggerService.logger.e(e);
    });
  }

  static getPermission() async {
    Firebase.initializeApp().whenComplete(() async {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      final permit = await messaging.requestPermission(
        alert: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      if(permit.authorizationStatus == AuthorizationStatus.authorized) {
        firebaseListener();
        getToken();
      }
    });
  }

  static firebaseListener() async {
    Firebase.initializeApp().whenComplete(() async {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      NotificationSettings settings = await messaging.getNotificationSettings();
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        debugPrint('User granted permission');

        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          debugPrint('Message data: ${message.messageId}-------opened');
          debugPrint('Message data: ${message.messageId}-------get data');
          FlutterRingtonePlayer.play(
              android: AndroidSounds.ringtone,
              ios: const IosSound(1036),
              looping: false,
              volume: 1.0,
              asAlarm: true
          );
        });

        FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
          debugPrint('Message data: ${message.messageId}-------opened');
          debugPrint('Message data: ${message.messageId}-------opened');
          FlutterRingtonePlayer.play(
              android: AndroidSounds.ringtone,
              ios: const IosSound(1036),
              looping: false,
              volume: 1.0,
              asAlarm: true
          );
        });

        messaging.onTokenRefresh.listen(saveTokenToDatabase);

      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        debugPrint('User granted provisional permission');
      } else {
        debugPrint('User declined or has not accepted permission');
      }
    });
  }

  static getToken() async {
    Firebase.initializeApp().whenComplete(() async {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      NotificationSettings settings = await messaging.getNotificationSettings();
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        await messaging.getToken().then((token) async {
          assert(token != null);
          debugPrint("MESSAGING TOKEN: ${token!}");
          await saveTokenToDatabase(token);
        });
      } else {
        debugPrint('User declined or has not accepted permission');
        debugPrint("MESSAGING TOKEN is null");
      }
    });
  }

  static saveTokenToDatabase(String token) async {
    await AuthHelper.saveDeviceToken(token);
  }

}