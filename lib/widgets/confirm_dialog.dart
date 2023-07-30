import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ConfirmDialog {
  static Future<bool> show(
    BuildContext context, {
    required String title,
    String cancel = 'لغو',
    String confirm = 'تایید',
    double? buttonWidth,
    Color yesColor = MainColors.primaryColor,
    String? message,
  }) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              elevation: 0,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: MainColors.grayDarkest,
                      ),
                    ),
                    if (message != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 10),
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: MainColors.grayDarkest,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    if (message == null) const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilledRoundedButtonSm(
                          label: confirm,
                          width: buttonWidth,
                          onTap: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              cancel,
                              style: const TextStyle(
                                color: MainColors.primaryColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ) ??
        false;
  }
}
