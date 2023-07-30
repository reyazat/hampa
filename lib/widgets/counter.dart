import 'package:flutter/material.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/utils/num_api.dart';

class Counter extends StatefulWidget {
  final int initialValue;
  final void Function(int)? onValueChanged;

  const Counter({this.onValueChanged, this.initialValue = 1});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int count;

  @override
  void initState() {
    count = widget.initialValue;
    widget.onValueChanged?.call(count);
    super.initState();
  }

  void changeValue(int newValue) {
    if (newValue > 0) {
      setState(() {
        count = newValue;
      });
      widget.onValueChanged?.call(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () => changeValue(count + 1),
          child: const Icon(
            Icons.add_circle_outline_rounded,
            color: MainColors.primaryColor,
            size: 26,
          ),
        ),
        Container(
          height: 30,
          width: 30,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MainColors.grayLight,
          ),
          child: Center(
            child: Text(
              count.toFaString(),
              style: const TextStyle(
                color: MainColors.grayDarkest,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => changeValue(count - 1),
          child: const Icon(
            Icons.remove_circle_outline_rounded,
            color: MainColors.primaryColor,
            size: 26,
          ),
        ),
      ],
    );
  }
}
