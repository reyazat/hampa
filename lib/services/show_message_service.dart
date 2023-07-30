import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/values/styles.dart';
import 'package:fitness/widgets/loading.dart';

class ShowMessageService {

  static showSuccessMsg(message) {
    return BotToast.showText(
      text: message,
      duration: const Duration(seconds: 6),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      contentColor: MainColors.greenMed,
      contentPadding: const EdgeInsets.all(20.0),
      textStyle: Styles.messageTextStyle,
    );
  }

  static showErrorMsg(message) {
    return BotToast.showText(
      text: message,
      duration: const Duration(seconds: 6),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      contentColor: MainColors.red,
      contentPadding: const EdgeInsets.all(20.0),
      textStyle: Styles.messageTextStyle,
    );
  }

  static showValidationMsg(message) {
    return BotToast.showText(
      text: message,
      duration: const Duration(seconds: 3),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      contentColor: MainColors.red,
      contentPadding: const EdgeInsets.all(20.0),
      textStyle: Styles.messageTextStyle,
      align: const Alignment(0, 0),
    );
  }

  static showSuccessNotify(title) {
    BotToast.showNotification(
        leading: (cancel) => SizedBox.fromSize(
            size: const Size(40, 40),
            child: IconButton(
              icon: const Icon(FontAwesomeIcons.info, color: Colors.white),
              onPressed: (){},
            )
        ),
        title: (_) => Text(title,style:Styles.messageTextStyle),
        trailing: (cancel) => IconButton(
          icon: const Icon(FontAwesomeIcons.xmark, color: Colors.white),
          onPressed: cancel,
        ),
        backgroundColor: MainColors.greenMed,
        enableSlideOff: true,
        borderRadius: 15.0,
        backButtonBehavior: BackButtonBehavior.none,
        crossPage: true,
        contentPadding: const EdgeInsets.all(10),
        onlyOne: true,
        animationDuration:
        const Duration(milliseconds: 200),
        animationReverseDuration:
        const Duration(milliseconds: 200),
        duration: null
    );
  }

  static showNotify(Widget title,Widget subtitle) {
    BotToast.showNotification(
        title: (_) => title,
        subtitle: (_) =>  subtitle,
        trailing: (cancel) => IconButton(
          icon: const Icon(FontAwesomeIcons.xmark, color: Colors.white),
          onPressed: cancel,
        ),
        backgroundColor: Colors.blue,
        enableSlideOff: true,
        borderRadius: 15.0,
        backButtonBehavior: BackButtonBehavior.none,
        crossPage: true,
        contentPadding: const EdgeInsets.all(10),
        onlyOne: true,
        animationDuration:
        const Duration(milliseconds: 200),
        animationReverseDuration:
        const Duration(milliseconds: 200),
        duration: null
    );
  }

  static showLoading({Function()? onClose}) {
    BotToast.showCustomLoading(
        toastBuilder: (func) => const Loading(),
      onClose: onClose
    );
  }

  static closeLoading() {
    BotToast.closeAllLoading();
  }

}