import 'package:flipkart_clone/screens/login_screen.dart';
import 'package:flipkart_clone/widgets/components/account_page_list_cart.dart';
import 'package:flutter/material.dart';


class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12 , left: 12 ,),
          child: const Text('Account',style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold)),
        ),

       Padding(
         padding: const EdgeInsets.only(bottom: 12 , left: 12 , right: 12),
         child: Row(
           children: [
             Expanded(child: const Text('Log in to get exclusive offers' , style: TextStyle(fontSize: 14),)),
             ElevatedButton(onPressed: (){
               Navigator.of(context).pushNamed(LoginScreen.routeName);
             }, child: Text('Log In'))
           ],
         ),
       ),

       const SizedBox(height: 8,),
        AccountPageListCard(),
      ],
    ));
  }
}
