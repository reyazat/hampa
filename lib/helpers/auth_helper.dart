import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {

  static Future getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("token");
  }

  static Future getDeviceToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("device_token");
  }

  static Future saveDeviceToken(token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("device_token", token);
  }

  static Future getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("userId");
  }

  static savePref({
    required int loginStatus,
    required int verified,
    required String mobile,
    required String token,
    String? userId,
    String? firstname,
    String? lastname,
    String? avatar,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("loginStatus", loginStatus);
    preferences.setInt("verified", verified);
    preferences.setString("mobile", mobile);
    preferences.setString("token", token);
    preferences.setString("userId", userId ?? '');
    preferences.setString("firstname", firstname ?? '');
    preferences.setString("lastname", lastname ?? '');
    preferences.setString("avatar", avatar ?? '');
  }

  static signOutPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("loginStatus");
    preferences.remove("verified");
    preferences.remove("mobile");
    preferences.remove("token");
    preferences.remove("firstname");
    preferences.remove("lastname");
    preferences.remove("avatar");
  }

}