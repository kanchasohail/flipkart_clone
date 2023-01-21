import 'package:flutter/material.dart';

class NotSignedCartPage extends StatelessWidget {
  const NotSignedCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.shopping_cart_outlined , size: 150, color: Colors.grey,),
        const SizedBox(height: 10,),
        const Text('Missing Cart items?' , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        ElevatedButton(onPressed: (){}, child: const Text('Login'))
      ],
    ));
  }
}
