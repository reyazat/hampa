import 'package:flutter/material.dart';

class ModalSheet {
  static void show({
    required BuildContext context,
    required Widget child,
    required double height,
    required EdgeInsetsGeometry padding,
    void Function()? onClose,
  }) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: height,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: padding,
              child: child,
            ),
          ),
        );
      },
    ).then((value) => onClose?.call());
  }
}