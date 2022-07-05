import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({
    Key? key,
    required this.defaultValue,
    required this.values,
    required this.onItemSelected,
  }) : super(key: key);
  final Function(int selectedValue) onItemSelected;
  final int defaultValue;
  final List<int> values;

  @override
  _CustomDropdownMenuState createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: widget.defaultValue,
      items: widget.values.map((dropValue) {
        return DropdownMenuItem<int>(
          value: dropValue,
          child: Text(dropValue.toString()),
        );
      }).toList(),
      onChanged: (newDropdownValue) {
        setState(() {
          widget.onItemSelected(newDropdownValue!);
        });
      },
    );
  }
}
