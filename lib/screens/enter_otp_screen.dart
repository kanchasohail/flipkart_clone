import 'package:firebase_auth/firebase_auth.dart';
import 'package:flipkart_clone/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class EnterOtpScreen extends StatefulWidget {
  static const routeName = '/enter-otp-screen';

  const EnterOtpScreen({Key? key}) : super(key: key);

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool isValid = false;

  var code = '';

  void _validate(String input) {
    if (input.trim().length == 6) {
      code = input.trim();
      setState(() {
        isValid = true;
      });
      return;
    } else {
      code = input.trim();
      setState(() {
        isValid = false;
      });
    }
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final String phoneNumber =
        ModalRoute.of(context)?.settings.arguments as String;

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter the otp to login'),
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
                    'Log in for the best experience',
                    style: TextStyle(fontFamily: 'rubik'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Enter the 6 digit code sent to $phoneNumber',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // TextField(
                  //   keyboardType: TextInputType.number,
                  //   onSubmitted: (value)async {
                  //     _validate(value);
                  //     if (isValid) {
                  //       authProvider.loginWithOtp(code, context);
                  //     }
                  //     return ;
                  //   },
                  //   onChanged: (value) {
                  //     _validate(value);
                  //   },
                  //   autofocus: true,
                  //   decoration: InputDecoration(
                  //     contentPadding: const EdgeInsets.all(8),
                  //     border: OutlineInputBorder(
                  //       borderSide:
                  //           BorderSide(color: Theme.of(context).primaryColor),
                  //     ),
                  //     labelText: 'Enter otp',
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Pinput(
                      onSubmitted: (value) async {
                        _validate(value);
                        if (isValid) {
                          authProvider.loginWithOtp(code, context);
                        }
                        return;
                      },
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      onChanged: (value) {
                        _validate(value);
                      },
                      onCompleted: (value) {
                        _validate(value);
                        if (isValid) {
                          authProvider.loginWithOtp(code, context);
                        }
                      },
                      autofocus: true,
                      length: 6,
                    ),
                  ),

                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      TextButton(onPressed: () {}, child: Text('Resend Otp')),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 20,
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
              onPressed: () async {
                if (isValid) {
                  authProvider.loginWithOtp(code, context);
                }
                return;
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
