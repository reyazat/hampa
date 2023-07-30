import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fitness/services/logger_service.dart';

class UrlLauncher {

  static Future _lunchUrl(BuildContext context, String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      LoggerService.logger.e('Could not launch $url');
    }
  }

  static lunchUrl(BuildContext context, String url) async {
    await _lunchUrl(context, url);
  }

  static lunchAddress(BuildContext context, String address) async {
    String url ;
    String encodeAddress = Uri.encodeComponent(address);
    if (Platform.isIOS) {
      url = 'https://maps.apple.com/?q=$encodeAddress';
    }else {
      url = 'https://maps.google.com/?q=$encodeAddress';
    }
    await _lunchUrl(context, url);
  }

  static lunchTelegram(BuildContext context, String telegramAccount) async {
    await _lunchUrl(context, 'https://t.me/$telegramAccount');
  }

  static lunchInstagram(BuildContext context, String instagramAccount) async {
    await _lunchUrl(context, 'instagram://user?username=$instagramAccount');
  }

  static lunchCall(BuildContext context, String phoneNumber) async {
    phoneNumber = phoneNumber.trim();
    phoneNumber = phoneNumber.replaceAll(' ','');
    await _lunchUrl(context, 'tel:$phoneNumber');
  }

  static lunchSms(BuildContext context, String phoneNumber) async {
    phoneNumber = phoneNumber.trim();
    phoneNumber = phoneNumber.replaceAll(' ','');
    await _lunchUrl(context, 'sms:$phoneNumber');
  }

  static lunchMailTo(BuildContext context, {String? email , String? subject, String? body}) async
  {
    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {
          'subject': subject,
          'body' : body
        }
    );

    await _lunchUrl(context, emailLaunchUri.toString());
  }

  static Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchInWebViewWithoutJavaScript(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchInWebViewWithoutDomStorage(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchUniversalLinkIos(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}