import 'package:flutter/material.dart';
import 'package:fitness/values/colors.dart';

class RoundedTextField extends StatelessWidget {
  final _controller = TextEditingController();
  final String? hint;
  final String? value;
  final String? suffixText;
  final int? maxLines;
  final bool readOnly;
  final EdgeInsets? padding;
  final void Function(String)? onChanged;

  RoundedTextField({
    this.hint,
    this.value,
    this.suffixText,
    this.onChanged,
    this.padding,
    this.maxLines = 1,
    this.readOnly = false,
  }) {
    _controller.text = value ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextField(
        readOnly: readOnly,
        maxLines: maxLines,
        controller: _controller,
        onChanged: onChanged,
        style: const TextStyle(color: MainColors.grayDarkest),
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          suffixText: suffixText,
          suffixStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: MainColors.primaryColor,
          ),
          fillColor: MainColors.grayLightest,
          hintStyle: const TextStyle(color: MainColors.grayMid),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
