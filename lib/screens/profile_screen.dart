import 'package:flipkart_clone/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = AuthProvider.Login as bool;
    return isLoggedIn ?Text('Welcome')  : Text('Not Logged In');
  }
}
