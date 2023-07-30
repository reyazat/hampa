import 'dart:io';

import 'package:fitness/models/init_model.dart';
import 'package:fitness/screens/verify_screen.dart';
import 'package:fitness/utils/utility.dart';
import 'package:fitness/values/Constants.dart';
import 'package:fitness/values/parameters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:fitness/network/app_network.dart';
import 'package:fitness/helpers/auth_helper.dart';
import 'package:fitness/provider/auth_state.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitness/services/firebase_notification_service.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:fitness/services/logger_service.dart';
import 'package:fitness/services/show_message_service.dart';
import 'package:fitness/screens/pages/home_page.dart';

class AuthProvider with ChangeNotifier, DiagnosticableTreeMixin {

  late AuthState _authState;

  late String _signInMobile;

  AuthProvider() {
    _authState = AuthInitial();
    init();
  }

  AuthState get authState => _authState;

  set authState(AuthState value) {
    _authState = value;
    notifyListeners();
  }

  String get signInMobile =>_signInMobile;

  set signInMobile(String value) {
    _signInMobile = value;
    notifyListeners();
  }

  clearSignIn() {
    signInMobile = '';
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('signInUserName', signInMobile));
  }

  Future<void> checkConnection() async {
    final connection = await DataConnectionChecker().connectionStatus;
    if(connection == DataConnectionStatus.disconnected) {
      debugPrint("Last results: ${DataConnectionChecker().lastTryResults}");
      authState = AuthNetworkError();
      ShowMessageService.showErrorMsg(Constants.noInternet);
    }
  }

  void init() async {
    await checkConnection();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var value = preferences.getInt("loginStatus");
    if (value == 1) {
      authState = AuthLoggedIn();
      Get.to(() => const VerifyScreen());
    }else {
      //await FirebaseMessagingService.getToken();
      //await FlutterRingtonePlayer.stop();

      authState = AuthLoaded();
    }
  }

  Future<void> signIn() async {
    authState = AuthLoading();
    ShowMessageService.showLoading();

    final deviceToken = await Utility.getSessionId();

    var body = {
      "mobile": signInMobile.trim(),
      "type": 'U',
      "device_token": deviceToken
    };

    await AppNetwork.postData('${Parameters.hostAPI}signin', body).then((response) async {

      if (response.success == false) {
        AuthHelper.signOutPreferences();
        authState = AuthLoaded();
        ShowMessageService.showErrorMsg(response.message);

      }else if (response.success == true) {
        AuthHelper.savePref(
          loginStatus: 1,
          verified: 0,
          mobile: signInMobile.trim(),
          token: response.data["token"],
        );

        authState = AuthLoggedIn();
        // Get.to(() => const VerifyScreen());
        Get.to(() => const HomePage());
      }
    }).catchError((error) {
      authState = AuthLoaded();
      ShowMessageService.closeLoading();
      LoggerService.logger.e(error);
    });
  }
/*
  Future<void> verifySignIn() async {
    authState = AuthLoading();
    ShowMessageService.showLoading();

    var body = {
      "token": signInMobile.trim(),
      "code": 'U',
      "device_token": await AuthHelper.getDeviceToken(),
    };

    await AppNetwork.postData('${Parameters.hostAPI}signin/verify', body).then((response) async {
      if (response.status == 'false') {
        await AuthHelper.signOutPreferences();
        authState = AuthLoaded();
        ShowMessageService.showErrorMsg(response.data);

      }else if (response.status == 'true') {
        AuthHelper.savePref(
            loginStatus: 0,
            socialLogin: 0,
            verified: 0,
            userid: response.data["user_id"],
            username: signInMobile.trim(),
            token: response.data["user_token"],
            firstname: '',
            lastname: ''
        );

        authState = AuthLoggedIn();
        Get.to(() => const VerifyScreen());
      }
    }).catchError((error) {
      authState = AuthLoaded();
      ShowMessageService.closeLoading();
      LoggerService.logger.e(error);
    });
  }*/

}