import 'package:flipkart_clone/widgets/categories_grid.dart';
import 'package:flipkart_clone/widgets/components/app_bar_row_with_logo.dart';
import 'package:flipkart_clone/widgets/search_bar_row_with_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sticky_headers/sticky_headers.dart';
import '../widgets/components/sliding_item.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart-page';

  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // return Center( child: Text('Cart Page'),);
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.purple,
          title: AppBarRowWithLogo(),
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.blue),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          StickyHeader(
            header: SearchBarRowWithSwitch(),
            content: Column(
              children: [
                SlidingItem(),
               CategoriesGrid(),
                Container(
                  height: 300,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Container(
                  height: 300,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Container(
                  height: 300,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Container(
                  height: 300,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Container(
                  height: 300,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Container(
                  height: 300,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Container(
                  height: 300,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Container(
                  height: 300,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Container(
                  height: 300,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Container(
                  height: 300,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
              ],
            ),
          )
        ]))
      ],
    ));
  }
}
