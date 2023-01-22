import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthProvider with ChangeNotifier {
  static bool? Login;

  final _auth = FirebaseAuth.instance;

  UserCredential? authResult;
  String _email = '';

  Future<bool> checkEmail(String email) async {
    print('Email Check called $email ******');
    _email = email;
    try {
      authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: 'pass');
    } catch (error) {
      if (error.toString() ==
          '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
        return true;
      } else if (error.toString() ==
          '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
        return false;
      }
    }
    return false;
  }

  // Future<bool> checkEmail(String email) async {
  //   print('Email Check called $email ******');
  //   try{
  //     authResult = await _auth.createUserWithEmailAndPassword(email: email, password: '07860786');
  //   }catch(error){
  //     if(error.toString() == '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.'){
  //       return true ;
  //     }
  //     else if(error.toString() == '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.'){
  //       return false ;
  //     }
  //   }
  //   return false ;
  // }

  void checkNumber(String number) {
    print('Number Check called $number ******');
  }

  Future<void> loginWithEmail(String password, BuildContext ctx) async {
    try {
      authResult = await _auth.signInWithEmailAndPassword(
          email: _email, password: password);
      print('login Successful with $_email and $password');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('Login', true);
      Login = true ;
      // Navigator.of(ctx).pushReplacementNamed(CartPage.routeName);
      // Navigator.of(ctx)..pop()..pop()..pushReplacementNamed(ProfileScreen.routeName);
      Restart.restartApp();
    } catch (error) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('Login', false);
      Login = false ;
      String message = 'Could not login please try again later';
      print(error);
      if (error.toString() ==
          '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
        message = 'Invalid password';
      }

      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          backgroundColor: Theme.of(ctx).errorColor, content: Text(message)));
    }
  }

  void signUpWithEmail(String password, BuildContext ctx) async {
    try {
      authResult = await _auth.createUserWithEmailAndPassword(
          email: _email, password: password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('Login', true);
      Login = true;
      print('Account created with email and password');
      // Navigator.of(ctx).pushReplacementNamed(CartPage.routeName);
      // Navigator.of(ctx)..pop()..pop();
      Restart.restartApp();
    } catch (error) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('Login', false);
      Login = false ;
      String message = 'Could not create an account something went wrong';
      print(error);
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          backgroundColor: Theme.of(ctx).errorColor, content: Text(message)));
    }
  }

  Future<void> logOut(BuildContext ctx) async {
    _auth.signOut() ;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('Login', false);
    Login = false ;
    Restart.restartApp();
  }

}
