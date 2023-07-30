import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';

class RadioButtonField extends StatefulWidget {
  final String label;
  final String? initialValue;
  final List<String> values;
  final void Function(String)? onChanged;

  const RadioButtonField({
    required this.label,
    required this.values,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<RadioButtonField> createState() => _RadioButtonFieldState();
}

class _RadioButtonFieldState extends State<RadioButtonField> {
  String? groupValue;

  @override
  void initState() {
    groupValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        fontFamily: 'Shabnam',
        color: MainColors.grayDarkest,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(widget.label),
          ),
          for (var value in widget.values)
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  widget.onChanged?.call(value);
                  groupValue = value;
                });
              },
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Radio<String>(
                      value: value,
                      splashRadius: 1,
                      activeColor: MainColors.primaryColor,
                      visualDensity: VisualDensity.compact,
                      groupValue: groupValue,
                      onChanged: (newValue) {
                        widget.onChanged?.call(newValue!);
                        setState(() {
                          groupValue = newValue!;
                        });
                      },
                    ),
                  ),
                  Expanded(child: Text(value)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
