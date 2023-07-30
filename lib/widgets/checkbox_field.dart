import 'package:flutter/material.dart';
import 'package:fitness/values/colors.dart';

class CheckboxField extends StatefulWidget {
  final bool initialValue;
  final String label;
  final void Function(bool)? onChange;

  const CheckboxField({required this.label, this.initialValue = false, this.onChange});

  @override
  State<CheckboxField> createState() => _CheckboxFieldState();
}

class _CheckboxFieldState extends State<CheckboxField> {
  late bool value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: value,
          splashRadius: 1,
          activeColor: MainColors.primaryColor,
          visualDensity: VisualDensity.compact,
          onChanged: (newValue) {
            setState(() {
              value = newValue ?? false;
            });
            widget.onChange?.call(value);
          },
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              value = !value;
            });
            widget.onChange?.call(value);
          },
          child: Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: MainColors.grayDarkest,
            ),
          ),
        ),
      ],
    );
  }
}
