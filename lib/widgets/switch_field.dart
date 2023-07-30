import 'package:fitness/values/colors.dart';
import 'package:flutter/cupertino.dart';

class SwitchField extends StatefulWidget {
  final bool initialValue;
  final void Function(bool newValue)? onChanged;

  const SwitchField({this.initialValue = false, this.onChanged});

  @override
  State<SwitchField> createState() => _SwitchFieldState();
}

class _SwitchFieldState extends State<SwitchField> {
  var value = false;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: CupertinoSwitch(
        value: value,
        activeColor: MainColors.primaryColor,
        onChanged: (newValue) {
          widget.onChanged?.call(newValue);
          setState(() {
            value = newValue;
          });
        },
      ),
    );
  }
}
