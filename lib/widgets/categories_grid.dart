import 'package:flipkart_clone/widgets/components/category_item_design.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/category_provider.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 222,
      // color: Colors.green,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(5),
      child: GridView(
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 80,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 4.4
        ),
        children: [
          ...Provider.of<CategoryProvider>(context , listen: false).categoryListItems.map((item) => Container(
            child: GestureDetector(
              // onTap:  , // Navigate to the target page
                child: CategoryItemDesign(item.title , item.imgUrl)),
          )).toList()

        ],
      ),
    );
  }
}
