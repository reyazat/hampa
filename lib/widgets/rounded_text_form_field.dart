import 'package:flutter/material.dart';
import 'package:fitness/values/colors.dart';
import 'package:flutter/services.dart';

class RoundedTextFormField extends StatelessWidget {

  final Key? fieldKey;
  final _controller = TextEditingController();
  final String? hint;
  final String? value;
  final String? suffixText;
  final int? maxLines;
  final bool readOnly;
  final EdgeInsets? padding;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  RoundedTextFormField({
    this.fieldKey,
    this.hint,
    this.value,
    this.suffixText,
    this.onSaved,
    this.onChanged,
    this.inputFormatters,
    this.validator,
    this.padding,
    this.maxLines = 1,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
  }) {
    _controller.text = value ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextFormField(
        key: fieldKey,
        readOnly: readOnly,
        maxLines: maxLines,
        controller: _controller,
        onSaved: onSaved,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        validator: validator,
        keyboardType: keyboardType,
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