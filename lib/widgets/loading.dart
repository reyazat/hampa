import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/values/size_styles.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Card(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(color: MainColors.primaryColor),
                SizedBox(width: SizeStyles.xl),
                Text('لطفا منتظر بمانید...',
                  style: TextStyle(
                    fontFamily: 'Shabnam',
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          )
      ),

    );
  }
}
