import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';

class SectionHeaderChannels extends StatelessWidget {
  final String title;
  final String subTitle;
  final void Function() onTapMore;

  const SectionHeaderChannels({
    required this.title,
    required this.subTitle,
    required this.onTapMore
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17, color: MainColors.grayDarkest),
              ),
              GestureDetector(
                onTap: onTapMore,
                child: Row(
                  children: const [
                    Text('مشاهده کانال',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: MainColors.primaryColor),
                    ),
                    Icon(Icons.keyboard_arrow_left, color: MainColors.primaryColor),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
             children: [
               Text(subTitle,
                 // textAlign: TextAlign.right,
                 style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: MainColors.grayDarkest),
               ),
             ],
          ),
        ],
      ),
    );
  }
}