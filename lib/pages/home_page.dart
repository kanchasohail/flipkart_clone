import 'package:cached_network_image/cached_network_image.dart';
import 'package:flipkart_clone/widgets/categories_grid.dart';
import 'package:flipkart_clone/widgets/components/app_bar_row_with_logo.dart';
import 'package:flipkart_clone/widgets/components/small_square_container.dart';
import 'package:flipkart_clone/widgets/search_bar_row_with_switch.dart';
import 'package:flutter/material.dart';

import 'package:sticky_headers/sticky_headers.dart';

import '../widgets/components/large_square_box.dart';
import '../widgets/components/sliding_item.dart';
import '../widgets/components/square_grid_item.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Icon _holderIcon = Icon(
      Icons.image_outlined,
      color: Colors.grey,
      size: double.infinity,
    );
    final Color _holderColor = Colors.grey.shade300 ;
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: AppBarRowWithLogo(),
          automaticallyImplyLeading: false,
          // systemOverlayStyle: SystemUiOverlayStyle(
          //   statusBarColor: Colors.white,
          // ),
          backgroundColor: Colors.white,
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
                  height: 70,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: _holderColor,
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            'https://rukminim1.flixcart.com/fk-p-flap/1688/280/image/448c152993ceefb3.jpeg',
                        placeholder: (ctx, url) => _holderIcon,
                        errorWidget: (ctx, url, error) => _holderIcon,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Color(0xff54A1E1)),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: GridView(
                      physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 3 / 3.8),
                      children: [
                        SquareGridItem(
                            'https://rukminim1.flixcart.com/flap/400/400/image/5daee8f038724602.jpg',
                            'Router'),
                        SquareGridItem(
                            'https://rukminim1.flixcart.com/flap/400/400/image/5daee8f038724602.jpg',
                            'Router'),
                        SquareGridItem(
                            'https://rukminim1.flixcart.com/flap/400/400/image/5daee8f038724602.jpg',
                            'Router'),
                        SquareGridItem(
                            'https://rukminim1.flixcart.com/flap/400/400/image/5daee8f038724602.jpg',
                            'Router'),
                      ],
                    ),
                  ),
                ),
                Container(
                  // color: Colors.pink,
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmallSquareContainer(
                          imageUrl:
                              'https://rukminim1.flixcart.com/flap/400/400/image/5daee8f038724602.jpg',
                          title: 'Headphones & more',
                          offer: 'Up to 80% off'),
                      SmallSquareContainer(
                          imageUrl:
                              'https://rukminim1.flixcart.com/flap/400/400/image/5daee8f038724602.jpg',
                          title: 'realme C30',
                          offer: 'From ₹5,749'),
                      SmallSquareContainer(
                          imageUrl:
                              'https://rukminim1.flixcart.com/flap/400/400/image/5daee8f038724602.jpg',
                          title: 'Jackets...',
                          offer: 'Up to 80% off'),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.pink,
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LangeSquareBox(
                          imageUrl:
                              'https://rukminim1.flixcart.com/flap/400/400/image/5daee8f038724602.jpg',
                          title: 'Headphones & more',
                          subtitle: 'Provogue , Wrong & more',
                          price: 'Under ₹699'),
                      LangeSquareBox(
                          imageUrl:
                              'https://rukminim1.flixcart.com/flap/400/400/image/5daee8f038724602.jpg',
                          title: 'Headphones & more',
                          subtitle: 'Provogue , Wrong & more',
                          price: 'From ₹9,900*'),
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
          )
        ]))
      ],
    ));
  }
}
