import 'package:flipkart_clone/models/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/category_card_model.dart';

class CategoryProvider with ChangeNotifier{
  final _categoriesList = <CategoryModel>[
    CategoryModel(title: 'Top Offers', imgUrl: 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/47e5c31ef7dcce1e.png', pageRoute: 'pageRoute'),
    CategoryModel(title: 'Mobiles & Tablets', imgUrl: 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/5f8bd5669e19e724.png', pageRoute: 'pageRoute'),
    CategoryModel(title: 'Electronics & Accessories', imgUrl: 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/361d53b8725c2d2d.png', pageRoute: 'pageRoute'),

    CategoryModel(title: 'TVs & Application', imgUrl: 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/904f3c8e7101408b.png', pageRoute: 'pageRoute'),
    CategoryModel(title: 'Fashion', imgUrl: 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/7f7355480c6adc16.png', pageRoute: 'pageRoute'),

    CategoryModel(title: 'Beauty , Toys & more ', imgUrl: 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/f97d6138516056bc.png', pageRoute: 'pageRoute'),
    CategoryModel(title: 'Home & Furniture', imgUrl: 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/6728ed3cf145562c.png', pageRoute: 'pageRoute'),
    CategoryModel(title: 'Flights', imgUrl: 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/007910082ae6355b.png', pageRoute: 'pageRoute'),
    CategoryModel(title: 'Grocery', imgUrl: 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/46376ceed3448aff.png', pageRoute: 'pageRoute'),
    CategoryModel(title: 'Home & Furniture', imgUrl: 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/6728ed3cf145562c.png', pageRoute: 'pageRoute'),

  ];

  List<CategoryModel> get categoryListItems {
    return [..._categoriesList].toList();
}



final _categoriesCardList = <CategoryCardModel> [
  CategoryCardModel('Flipkart Samarth', 'Handicrafts , Decor , Art...', 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/6728ed3cf145562c.png' ,Colors.lightBlueAccent),
  CategoryCardModel('Happy Winter', 'Clothing, Decor & more', 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/6728ed3cf145562c.png' ,Colors.lightBlueAccent),
  CategoryCardModel('International Store', 'Brands Across the World', 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/6728ed3cf145562c.png' ,Colors.lightBlueAccent),
  CategoryCardModel('Flipkart Green', 'The Sustainable Store', 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/6728ed3cf145562c.png' ,Colors.lightBlueAccent),
  CategoryCardModel('Flipkart Originals', 'Fashion, Electronics, Beauty Appliances, Furniture...', 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/6728ed3cf145562c.png' ,Colors.lightBlueAccent),
  CategoryCardModel('Travel Store', 'See the world with Ease', 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/6728ed3cf145562c.png' ,Colors.lightBlueAccent),
  CategoryCardModel('Flipkart Emerging Brands', 'Innovative s Unique', 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/6728ed3cf145562c.png' ,Colors.teal),
  CategoryCardModel('Launch Hub', 'New Launches', 'https://rukminim1.flixcart.com/fk-p-flap/128/128/image/6728ed3cf145562c.png' ,Colors.purple),
];

  List<CategoryCardModel> get  categoryCardListItems {
    return [..._categoriesCardList].toList();
}

}