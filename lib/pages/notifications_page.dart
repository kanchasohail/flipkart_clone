import 'package:flipkart_clone/widgets/components/not_signed_notification_page.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications' , style: TextStyle(fontFamily: 'rubik'),),
      ),
      body: NotSignedNotificationPage(),
    );
  }
}
