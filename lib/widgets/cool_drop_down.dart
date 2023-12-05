import 'package:flutter/material.dart';

class CoolDropDownButton extends StatefulWidget {
  final String initialValue;
  final List<String> items;
  final Function(String) onChanged;

  CoolDropDownButton({
    required this.initialValue,
    required this.items,
    required this.onChanged,
  });

  @override
  _CoolDropDownButtonState createState() => _CoolDropDownButtonState();
}

class _CoolDropDownButtonState extends State<CoolDropDownButton> {
  String _selectedValue = '';

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color(0xff140093),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          iconEnabledColor: Colors.white,
          borderRadius: BorderRadius.circular(20),
          value: _selectedValue,
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedValue = newValue!;
            });
            widget.onChanged(newValue!);
          },
          dropdownColor: Color(0xff2426a1),
          elevation: 5,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
