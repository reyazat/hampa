import 'package:flutter/material.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/values/size_styles.dart';

class Styles {

  static const textLabStyle = TextStyle(
    fontSize: SizeStyles.textL,
    color: MainColors.dark,
    fontWeight: FontWeight.w600,
  );

  static const textLargeLabStyle = TextStyle(
    fontSize: SizeStyles.textXL,
    color: MainColors.dark,
    fontWeight: FontWeight.w700,
  );

  static const errorTextStyle = TextStyle(
    fontSize: SizeStyles.textL,
    color: MainColors.red,
    fontWeight: FontWeight.w700,
  );

  static const messageTextStyle = TextStyle(
    fontSize: 17.0,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static const textHintStyle = TextStyle(
    fontSize: SizeStyles.textM,
    color: MainColors.grey,
    fontWeight: FontWeight.w600,
  );

  static const textStyle = TextStyle(
    fontSize: SizeStyles.textL,
    color: MainColors.darkLight,
    fontWeight: FontWeight.w400,
  );

  static const textTitleStyle = TextStyle(
    fontSize: SizeStyles.textXXL,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const textMedTitleStyle = TextStyle(
    fontSize: 14,
    color: MainColors.dark,
    fontWeight: FontWeight.w600,
  );

  static const textTitleStyle2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const textActionStyle = TextStyle(
    inherit: false,
    fontSize: 16.9,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.alphabetic,
  );

  static const inputBorderDecoration = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(
      color: MainColors.greyLight,
    ),
  );

  static const inputErrorBorderDecoration = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(
      color: MainColors.red,
    ),
  );

  static final selectBoxDecoration = BoxDecoration(
    color: MainColors.inputColor,
    borderRadius: BorderRadius.circular(30),
  );

  static final itemBoxDecoration = BoxDecoration(
    color: MainColors.itemColor,
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [boxShadow],
  );

  static final boxShadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 10,
    spreadRadius: 0.5,
  );

}