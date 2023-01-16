import 'package:flutter/material.dart';

class LanguageItem extends StatefulWidget {
  const LanguageItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  int groupValue = -1;

  @override
  void initState() {
    super.initState();
    // groupValue = -1;
  }

  void selectTile(int val) {
    setState(() {
      groupValue = val;
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
          title: const Text('Hello'),
          subtitle: const Text("how are you"),
          activeColor: _primaryColor,
          selected: widget.index == groupValue,
          secondary: Icon(
            Icons.ac_unit,
            color: widget.index == groupValue
                ? _primaryColor
                : Colors.grey.shade400,
          ),
          value: widget.index,
          groupValue: groupValue,
          onChanged: (val) {
            selectTile(val!);
          }),
    );
  }
}
