import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/rounded_card.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final List<String> items;
  final void Function(int index)? onChange;

  const ToggleButton({required this.items, this.onChange});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (var i = 0; i < widget.items.length; i++)
          Expanded(
            child: RoundedCard(
              onTap: () {
                setState(() {
                  index = i;
                });
                widget.onChange?.call(i);
              },
              color: index == i ? MainColors.primaryColor : null,
              margin: EdgeInsets.only(left: i == widget.items.length - 1 ? 0 : 10),
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
              child: Text(
                widget.items[i],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: index == i ? Colors.white : MainColors.primaryColor,
                ),
              ),
            ),
          ),
      ],
    );
  }
}