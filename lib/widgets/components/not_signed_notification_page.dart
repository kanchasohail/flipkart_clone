import 'package:flipkart_clone/screens/login_screen.dart';
import 'package:flutter/material.dart';

class NotSignedNotificationPage extends StatelessWidget {
  const NotSignedNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/no-notifications.webp'),
            Text('You\'re missing out. ' , style: TextStyle(fontFamily: 'rubik' , fontSize: 18),),
            Container(
              margin: EdgeInsets.only(top: 14 , bottom: 8),
              width: MediaQuery.of(context).size.width / 2,
              child: Text('Sign in to view personalised notifications and offers.' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w500), textAlign: TextAlign.center),
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            }, child: Text('Sign In'))
          ],
        ),
      ),
    );
  }
}
