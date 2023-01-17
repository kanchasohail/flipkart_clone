import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageItem extends StatefulWidget {
  LanguageItem({Key? key, required this.index , required this.title , required this.subtitle , required this.isSelected}) : super(key: key);
  final int index;
  final String title ;
  final String subtitle ;
  final Function(String title) isSelected ;


  @override
  State<LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  int groupValue = -1;

  void selectTile(int val) {
    setState(() {
      groupValue = val;
      // val = groupValue ;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color _primaryColor = Theme.of(context).primaryColor;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: widget.index == groupValue
                ? _primaryColor
                : Colors.grey.shade400,
            width: 2),
      ),
      height: 75,
      child: RadioListTile(
          title: Text(widget.title),
          subtitle: Text(widget.subtitle),
          activeColor: _primaryColor,
          selected: widget.index == groupValue,
          secondary: Icon(
            Icons.language,
            color: widget.index == groupValue
                ? _primaryColor
                : Colors.grey.shade400,
          ),
          value: widget.index,
          groupValue: groupValue,
          onChanged: (val) {
            widget.isSelected(widget.title) ;
            selectTile(val!);
          }),
    );
  }
}
