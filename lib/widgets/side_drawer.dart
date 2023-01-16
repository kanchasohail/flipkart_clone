import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flipkart_clone/providers/Language_provider.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.blue,
          ),
          Divider(),
          Container(
            height: 100,
            color: Colors.blue,
          ),
          FutureBuilder(
            future: Provider.of<LanguageProvider>(context).getLanguage(),
            builder: (ctx, snap) =>
                snap.connectionState == ConnectionState.waiting
                    ? CircularProgressIndicator()
                    : Container(
                        height: 100,
                        color: Colors.blue,
                        child: Text(snap.data.toString()),
                      ),
          ),
        ],
      ),
    );
  }
}
