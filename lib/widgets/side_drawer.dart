import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(height: 100, color: Colors.blue,),
          Divider(),
          Container(height: 100, color: Colors.blue,),

        ],
      ),
    );
  }
}
