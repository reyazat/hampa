import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends AppBar {
  MyAppBar({required String title, List<Widget>? actions})
      : super(
          title: Text(title),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios_sharp),
          ),
          actions: actions,
        );
}
