import 'package:fitness/screens/pages/home_page.dart';
import 'package:fitness/utils/num_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen();

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  static const _counterDuration = Duration(minutes: 4, seconds: 59);
  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();

  String code1 = '';
  String code2 = '';
  String code3 = '';
  String code4 = '';

  bool showCounter = true;
  var counter = _counterDuration;

  void startTimer() async {
    var duration = const Duration(seconds: 1);

    while (showCounter) {
      await Future.delayed(duration);
      counter -= duration;

      if (counter.inSeconds == 0) {
        setState(() {
          showCounter = false;
        });
      }

      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'کد تایید',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 32,
                      color: MainColors.grayDarkest,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 70, top: 15),
                    child: GestureDetector(
                      onTap: () async {
                        if (!showCounter) {
                          /// TODO: Call API to resend SMS verification code
                          counter = _counterDuration;
                          setState(() {
                            showCounter = true;
                          });
                          startTimer();
                        }
                      },
                      child: showCounter
                          ? Text(
                              '${counter.inMinutes.toTime()}:${(counter.inSeconds % 60).toTime()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: MainColors.primaryColor,
                              ),
                            )
                          : const Text(
                              'ارسال مجدد',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: MainColors.primaryColor,
                              ),
                            ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OTPInput(
                        focusNode: focusNode1,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            code1 = value;
                            focusNode1.nextFocus();
                          }
                        },
                      ),
                      OTPInput(
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            code2 = value;
                            focusNode1.nextFocus();
                          }
                        },
                      ),
                      OTPInput(
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            code3 = value;
                            focusNode1.nextFocus();
                          }
                        },
                      ),
                      OTPInput(
                        focusNode: focusNode2,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            code4 = value;
                            focusNode2.unfocus();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: GetPlatform.isAndroid ? 20 : 0),
              child: FilledRoundedButton(
                label: 'تایید',
                // onTap: () => Get.to(() => const HomePage()),
                onTap: () => Navigator.push(context, HomePage() as Route<Object?>),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    showCounter = false;
    super.dispose();
  }
}

class OTPInput extends StatelessWidget {
  final FocusNode? focusNode;
  final void Function(String) onChanged;

  const OTPInput({this.focusNode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70,
        width: 60,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          maxLength: 1,
          focusNode: focusNode,
          textAlign: TextAlign.center,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            filled: true,
            fillColor: MainColors.grayLightest,
            hintStyle: const TextStyle(color: MainColors.grayMid),
            isDense: true,
            counterText: '',
            counterStyle: const TextStyle(height: double.minPositive),
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: MainColors.grayDarkest,
            fontSize: 30,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
