import 'package:flipkart_clone/providers/category_provider.dart';
import 'package:flipkart_clone/widgets/components/category_grid_card.dart';
import 'package:flipkart_clone/widgets/components/rounded_category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context , listen: false);


    return CustomScrollView(

      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: Text('All Categories' , style: TextStyle(fontFamily: 'rubik'),),
        ),
        SliverList(delegate: SliverChildListDelegate([
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 365,
                child: GridView(
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 110,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3/3.6,
                  ),
                  children: [
                    ...categoryProvider.categoryListItems .map((item) => RoundedCategoryItem(imgUrl: item.imgUrl, title: item.title)).toList()
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Trending Stores' , style: TextStyle(fontFamily: 'RubikBold' , fontSize: 20),),
                  ),
                  Expanded(child: Divider(height: 2, color: Colors.grey,))
                ],
              ),
              Container(
                // height: 300,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(14),
                child: GridView(
                  physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 180,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 3/3,
                ),
                  children: [
                    ...categoryProvider.categoryCardListItems.map((item) => CategoryGridCard(title: item.title, description: item.description, imgUrl: item.imgUrl, bgColor: item.bgColor)).toList()
                  ],
                ),
              )
            ],
          ),
        ]))
      ],
    );

  }
}
