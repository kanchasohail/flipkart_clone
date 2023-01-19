import 'package:flipkart_clone/models/side_drawer_list_model.dart';
import 'package:flipkart_clone/pages/cart_page.dart';
import 'package:flutter/material.dart';

class SideDrawerListProvider with ChangeNotifier{


List sideDrawerItems = [
  SideDrawerListModel(icon: Icon(Icons.add , color: Colors.grey.shade600,), title: 'Flipkart Plus Zone', routeName: CartPage.routeName),
  SideDrawerListModel(icon: Icon(Icons.window_sharp , color: Colors.grey.shade600,), title: 'All Categories', routeName: CartPage.routeName),
  SideDrawerListModel(icon: Icon(Icons.store , color: Colors.grey.shade600,), title: 'Trending Stores', routeName: CartPage.routeName),
  SideDrawerListModel(icon: Icon(Icons.dialpad_rounded , color: Colors.grey.shade600,), title: 'More on Flipkart', routeName: CartPage.routeName),
  SideDrawerListModel(icon: Icon(Icons.language_outlined , color: Colors.grey.shade600,), title: 'Choose Language', routeName: CartPage.routeName),
  SideDrawerListModel(icon: Icon(Icons.local_offer , color: Colors.grey.shade600,), title: 'Offer Zone', routeName: CartPage.routeName),
  SideDrawerListModel(icon: Icon(Icons.shopping_bag , color: Colors.grey.shade600,), title: 'Sell on Flipkart', routeName: CartPage.routeName),
  SideDrawerListModel(icon: Icon(Icons.present_to_all_outlined , color: Colors.grey.shade600,), title: 'My Orders', routeName: CartPage.routeName),
  SideDrawerListModel(icon: Icon(Icons.card_giftcard_rounded , color: Colors.grey.shade600,), title: 'Coupons', routeName: CartPage.routeName),
  SideDrawerListModel(icon: Icon(Icons.shopping_cart , color: Colors.grey.shade600,), title: 'My Cart', routeName: CartPage.routeName),
  SideDrawerListModel(icon: Icon(Icons.heart_broken , color: Colors.grey.shade600,), title: 'My Wishlist', routeName: CartPage.routeName),
  SideDrawerListModel(icon: Icon(Icons.person , color: Colors.grey.shade600,), title: 'My Account', routeName: CartPage.routeName),
  SideDrawerListModel(icon: Icon(Icons.notifications , color: Colors.grey.shade600,), title: 'My Notifications', routeName: CartPage.routeName),
];

}