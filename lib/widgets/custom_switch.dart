import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return  FlutterSwitch(
      activeColor: Colors.black,
      inactiveColor: Colors.grey.shade300,
      activeTextColor: Colors.white,
      inactiveTextColor: Colors.black,
      activeText:'ON',
      inactiveText: 'OFF',
      activeTextFontWeight: FontWeight.w500,
      inactiveTextFontWeight: FontWeight.w600,
      width: 45.0,
      // width: 55.0,
      height: 15.0,
      valueFontSize: 10.0,
      toggleSize: 18.0,
      padding: 0,
      value: status,
      showOnOff: true,
      onToggle: (val) {
        setState(() {
          status = val;
        });
      },
    );
  }
}
