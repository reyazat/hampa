import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  final List<String> items;
  final void Function()? onChange;

  const DropDownMenu({required this.items, this.onChange});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    selectedValue ??= widget.items[0];

    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        dropdownElevation: 2,
        items: getMenuItems(),
        //customItemsIndexes: getDividersIndexes(),
        //customItemsHeights: const [4],
        value: selectedValue,
        itemHeight: 40,
        dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        itemPadding: const EdgeInsets.symmetric(horizontal: 0),
        customButton: SizedBox(
          width: 150,
          child: Row(
            children: <Widget>[
              Text(
                selectedValue ?? '',
                style: const TextStyle(color: MainColors.primaryColor, fontWeight: FontWeight.w600, fontSize: 15),
              ),
              const Icon(Icons.arrow_drop_down, color: MainColors.primaryColor)
            ],
          ),
        ),
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
          widget.onChange?.call();
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> getMenuItems() {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in widget.items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                item,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: MainColors.grayDarkest),
              ),
            ),
          ),
          if (item != widget.items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(color: MainColors.grayLightest, thickness: 2),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<int> getDividersIndexes() {
    List<int> dividersIndexes = [];
    for (var i = 1; i < (widget.items.length * 2) - 1; i += 2) {
      dividersIndexes.add(i);
    }
    return dividersIndexes;
  }
}