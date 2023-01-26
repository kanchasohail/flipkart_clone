import 'package:firebase_auth/firebase_auth.dart';
import 'package:flipkart_clone/screens/enter_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  static bool? Login;
  final _auth = FirebaseAuth.instance;

  UserCredential? authResult;
  String _email = '';
  String verId = '';
  int resendToken = 0;

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

  void getOtp(BuildContext ctx, String phoneNumber) async {

    print('login called with this number $phoneNumber **********');
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential).then((value) async {
          if(value.user != null){
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('Login', true);
            Login = true;
            Restart.restartApp();
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        if(e.code == 'invalid-phone-number'){
          ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
              backgroundColor: Theme.of(ctx).errorColor, content: Text('Invalid phone number')));
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        verId = verificationId;
        resendToken = resendToken ;
        Navigator.of(ctx).pushNamed(EnterOtpScreen.routeName , arguments: phoneNumber);
      },
      forceResendingToken: resendToken,
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        verId = verificationId ;
      },
    );
  }

  Future<void> loginWithOtp(String code, BuildContext ctx) async {
    
    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verId, smsCode: code);
      // await _auth.signInWithCredential(credential);
      await _auth.signInWithCredential(credential).then((value) async {
        if(value.user != null){
          SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('Login', true);
      Login = true;
      Restart.restartApp();
        }
      });
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setBool('Login', true);
      // Login = true;
      // Restart.restartApp();
    } catch (error) {
      print(error);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('Login', false);
      Login = false;
      String message = 'Could not verify otp please try again later';
      print(error);
      if (error.toString() ==
          '[firebase_auth/session-expired] The sms code has expired. Please re-send the verification code to try again.') {
        message = 'The otp is expired please click on Resend Otp';
      }

      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          backgroundColor: Theme.of(ctx).errorColor, content: Text(message)));
    }
  }

  Future<void> loginWithEmail(String password, BuildContext ctx) async {
    try {
      authResult = await _auth.signInWithEmailAndPassword(
          email: _email, password: password);
      print('login Successful with $_email and $password');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('Login', true);
      Login = true;
      // Navigator.of(ctx).pushReplacementNamed(CartPage.routeName);
      // Navigator.of(ctx)..pop()..pop()..pushReplacementNamed(ProfileScreen.routeName);
      Restart.restartApp();
    } catch (error) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('Login', false);
      Login = false;
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
      Login = false;
      String message = 'Could not create an account something went wrong';
      print(error);
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          backgroundColor: Theme.of(ctx).errorColor, content: Text(message)));
    }
  }

  Future<void> logOut(BuildContext ctx) async {
    _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('Login', false);
    Login = false;
    Restart.restartApp();
  }
}
