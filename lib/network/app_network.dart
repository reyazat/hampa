import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:fitness/helpers/auth_helper.dart';
import 'package:fitness/models/init_model.dart';
import 'package:fitness/network/dio_client.dart';
import 'package:fitness/services/logger_service.dart';
import 'package:flutter/cupertino.dart';

class AppNetwork {

  static Future<Options> setOptions() async {
    Options opt = Options();

    final token = await AuthHelper.getToken();
    if(token.toString().trim() != '' || token.toString().isNotEmpty) {
      opt = Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      );
    }

    return opt;
  }

  static Future<InitModel> getData(String url, {params}) async {
    late InitModel result;

    try {
      final response = await DioClient().getDio().get(url,
        queryParameters: params ?? {},
        options: await setOptions(),
      ).catchError((e) {
        LoggerService.logger.e(e);
        return e;
      });

      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
        result = InitModel.fromJson(response.data);
      }else {
        LoggerService.logger.w(response.statusMessage);
      }

    } catch (e) {
      LoggerService.logger.e(e);
    }

    BotToast.closeAllLoading();
    return result;
  }

  static Future<InitModel> postData(String url, Map<String, dynamic> body) async {
    late InitModel result;

    try {
      final response = await DioClient().getDio().post(url,
        data: jsonEncode(body),
        queryParameters: {},
        options: await setOptions(),
      ).catchError((e) {
        LoggerService.logger.e(e);
        return e;
      });

      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
        result = InitModel.fromJson(response.data);
      }else {
        LoggerService.logger.w(response.statusMessage);
      }

    } catch (e) {
      LoggerService.logger.e(e);
    }

    BotToast.closeAllLoading();
    return result;
  }

}