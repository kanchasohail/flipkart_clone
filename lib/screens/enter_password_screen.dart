import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class EnterPasswordScreen extends StatefulWidget {
  static const routeName = '/enter-password-screen';
  const EnterPasswordScreen({Key? key}) : super(key: key);
  
  @override
  State<EnterPasswordScreen> createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<EnterPasswordScreen> {

  bool isValid = false;
  String password = '';

  void _validate(String input){
    if(input.trim().length < 8){
      setState((){
        isValid = false ;
      });
      return ;
    } else{
      password = input.trim() ;
      setState((){
        isValid = true ;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final bool hasAccount = ModalRoute.of(context)?.settings.arguments as bool;
    final _authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(hasAccount ? 'Welcome Back' : 'Create an account'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    hasAccount ?  'Log in for the best experience' : 'Looks like you\'re new here',
                    style: TextStyle(fontFamily: 'rubik'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Enter your password to login',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    // controller: _inputController,
                    onSubmitted: (value){
                      _validate(value);
                      if(isValid){
                        hasAccount ?  _authProvider.loginWithEmail(password, context) : _authProvider.signUpWithEmail(password , context);
                      }
                      return ;
                    },
                    onChanged: (value) {
                      _validate(value);
                    },
                    autofocus: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      labelText: 'Enter your password',
                    ),
                  ),
                  const SizedBox(height: 20,),
                  // Row(
                  //   children: [
                  //     const Expanded(child: SizedBox()),
                  //     TextButton(
                  //         onPressed: _swapMethod, child: Text('Use $btnText')),
                  //   ],
                  // ),
                  FittedBox(
                    child: Text(
                      'By continuing you agree to Flipkart\'s Terms of Use and Privacy Policy',
                      maxLines: 1,
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: Colors.grey.shade400))),
            padding: const EdgeInsets.all(8),
            height: 66,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if(isValid){
                  hasAccount ?  _authProvider.loginWithEmail(password, context) : _authProvider.signUpWithEmail(password , context);
                }
                return ;
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                  isValid ? Colors.deepOrangeAccent : Colors.grey),
              child: const Text('SUBMIT'),
            ),
          )
        ],
      ),
    );
  }
}
