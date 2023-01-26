import 'package:flipkart_clone/providers/auth_provider.dart';
import 'package:flipkart_clone/screens/enter_password_screen.dart';
import 'package:flipkart_clone/widgets/login_form.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var _isLoading = false ;
  bool? hasAccount ;
  final String countryCode = '+91 ';

  void _sendNumber(String number){
    final _authProvider = Provider.of<AuthProvider>(context , listen: false) ;
    // _authProvider.checkNumber(number);
    _authProvider.getOtp(context , '${countryCode + number}');

  }

  Future<void> _sendEmail(String email) async {
    final _authProvider = Provider.of<AuthProvider>(context , listen: false) ;
   hasAccount = await _authProvider.checkEmail(email);
   print('hasAccount = $hasAccount');
   if(hasAccount != null){
     Navigator.of(context).pushNamed(EnterPasswordScreen.routeName , arguments: hasAccount);
   }
  }

  @override
  Widget build(BuildContext context) {
    // final log = Provider.of<AuthProvider>(context , listen: false) ;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
     body: LoginForm(_sendNumber , _sendEmail),
    );
  }
}
