import 'package:flutter/material.dart';
import 'package:fitness/values/colors.dart';

class Info extends StatelessWidget {
  final String info;
  final String? description;

  const Info(this.info, {this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (description != null) {
          openDescription(context);
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Icon(Icons.info_outlined, color: MainColors.primaryColor),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              info,
              style: const TextStyle(
                color: MainColors.grayDarkest,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openDescription(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              description!,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: MainColors.grayDarkest,
              ),
            ),
          ),
        );
      },
    );
  }
}
