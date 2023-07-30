import 'dart:convert' show utf8;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:fitness/values/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';

class Utility {

  static String decodeUtf8(String text) {
    var unescape = HtmlUnescape();
    text = unescape.convert(text);
    text = text.replaceAll('&amp;', '&');
    text = text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'),' ');
    var encoded = utf8.encode(text.toString());
    var decode = (utf8.decode(encoded));

    return decode;
  }

  static String isEmpty(String? value) {
    if(value != null && value != '' && value.isNotEmpty) {
      return '';
    } else {
      return Constants.required;
    }
  }

  static String? phoneNumberValidator(String value)
  {
    String pattern = r'09[0-3][0-9]-?[0-9]{3}-?[0-9]{4}';
    RegExp regExp = RegExp(pattern);

     if (value.isEmpty || (!regExp.hasMatch(value))) {
      return Constants.mobileNum;
    }

    return null;
  }

  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());

    if (!regex.hasMatch(value)) {
      return Constants.invalidEmail;
    } else {
      return '';
    }
  }

  static String validatePassword(String value) {
    if (value.length < 8) {
      return Constants.invalidPass;
    } else {
      return '';
    }
  }

  static Future<String?> getSessionId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      debugPrint('Running on ${androidInfo.id}');
      return androidInfo.id;

    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      debugPrint('Running on ${iosInfo.identifierForVendor}');
      return iosInfo.identifierForVendor;

    }else {
      return '';
    }
  }

  static updatePref(Type type, dynamic key) async {
    dynamic res ;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(type == int){
      res = preferences.getInt(key);
    }else if(type == String){
      res = preferences.getString(key);
    }else if(type == bool){
      res = preferences.getBool(key);
    }else if(type == double){
      res = preferences.getDouble(key);
    }else if(type == List){
      res = preferences.getStringList(key);
    }else{
      res = preferences.get(key);
    }
    return res;
  }

}