import 'package:flipkart_clone/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import '../widgets/components/not_signed_cart_page.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart-page';

  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // late SharedPreferences _pref;
  //
  // @override
  // didChangeDependencies(){
  //   _getInstance() ;
  //   super.didChangeDependencies();
  // }
  //
  //
  // Future<void> _getInstance() async {
  //   _pref = await SharedPreferences.getInstance() ;
  // }



  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = AuthProvider.Login as bool;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart' , style: TextStyle(color: Colors.black , fontFamily: 'rubik'),),
        backgroundColor: Colors.grey.shade300,
        shadowColor: Colors.transparent,
      ),
        body: isLoggedIn ? Center(child: Text('Logged in successfully'),) : NotSignedCartPage());
  }
}
