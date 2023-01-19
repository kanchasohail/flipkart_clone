import 'package:flipkart_clone/widgets/components/app_bar_row_with_logo.dart';
import 'package:flipkart_clone/widgets/search_bar_row_with_switch.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../widgets/components/sliding_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: AppBarRowWithLogo(),
          automaticallyImplyLeading: false,
          // systemOverlayStyle: SystemUiOverlayStyle(
          //   statusBarColor: Colors.white,
          // ),
          backgroundColor: Colors.white,
        ),
        SliverList(delegate: SliverChildListDelegate([

          StickyHeader(
            header: SearchBarRowWithSwitch(),
            content: Column(
              children: [

                SlidingItem(),
                Container(height: 300, color: Colors.green, margin: EdgeInsets.symmetric(vertical: 10),),
                Container(height: 300, color: Colors.green, margin: EdgeInsets.symmetric(vertical: 10),),
                Container(height: 300, color: Colors.green, margin: EdgeInsets.symmetric(vertical: 10),),
                Container(height: 300, color: Colors.green, margin: EdgeInsets.symmetric(vertical: 10),),
                Container(height: 300, color: Colors.green, margin: EdgeInsets.symmetric(vertical: 10),),
                Container(height: 300, color: Colors.green, margin: EdgeInsets.symmetric(vertical: 10),),
                Container(height: 300, color: Colors.green, margin: EdgeInsets.symmetric(vertical: 10),),
                Container(height: 300, color: Colors.green, margin: EdgeInsets.symmetric(vertical: 10),),
                Container(height: 300, color: Colors.green, margin: EdgeInsets.symmetric(vertical: 10),),
                Container(height: 300, color: Colors.green, margin: EdgeInsets.symmetric(vertical: 10),),
                Container(height: 300, color: Colors.green, margin: EdgeInsets.symmetric(vertical: 10),),

              ],
            ),
          )
        ]))
      ],
    ));
  }
}
