import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  LoginForm(this._checkNumber , this._checkEmail) ;


  final Function _checkNumber ;
  final Function _checkEmail ;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final List _methods = ['phone number', 'Email ID'];
  String method = 'phone number';
  late bool isNumber;

  String btnText = 'Email ID';
  final FocusNode _inputFocus = FocusNode();
  final TextEditingController _inputController = TextEditingController();

  bool isValid = false;

  var inputText;

  @override
  void initState() {
    isNumber = false;
    Future.delayed(const Duration(milliseconds: 1), () {
      FocusScope.of(context).requestFocus(_inputFocus);
      _swapMethod();
    });
    super.initState();
  }

  @override
  void dispose() {
    _inputFocus.dispose();
    _inputController.dispose();
    super.dispose();
  }

  void _validate(final String value) {
    if (isNumber) {
      if (value.length >= 10 && value.length < 11) {
        inputText = value.trim();
        setState(() {
          isValid = true;
        });
      } else {
        setState(() {
          isValid = false;
        });
      }
    } else {
      if (value.contains('@') && value.endsWith('.com')) {
        inputText = value.trim();
        setState(() {
          isValid = true;
        });
      } else {
        setState(() {
          isValid = false;
        });
      }
    }
  }

  void _swapMethod() {
    _inputController.clear();
    isValid = false;
    // if(method == _methods[0]){
    if (isNumber) {
      _inputFocus.unfocus();
      setState(() {
        method = _methods[1];
        btnText = _methods[0];
        isNumber = !isNumber;
        Future.delayed(const Duration(milliseconds: 1), () {
          FocusScope.of(context).requestFocus(_inputFocus);
        });
      });
    } else {
      _inputFocus.unfocus();
      setState(() {
        method = _methods[0];
        btnText = _methods[1];
        isNumber = !isNumber;

        Future.delayed(const Duration(milliseconds: 1), () {
          FocusScope.of(context).requestFocus(_inputFocus);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Log in for the best experience',
                  style: TextStyle(fontFamily: 'rubik'),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Enter your $method to continue',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  keyboardType: !isNumber
                      ? TextInputType.number
                      : TextInputType.emailAddress,
                  controller: _inputController,
                  onSubmitted: (value){
                    _validate(value);
                    if (isValid) {
                      isNumber ? widget._checkNumber(_inputController.text.toString()) : widget._checkEmail(_inputController.text.toString());
                    }
                    return;
                  },
                  onChanged: (value) {
                    _validate(value);
                  },
                  autofocus: true,
                  focusNode: _inputFocus,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    prefix: method == _methods[1]
                        ? const SizedBox()
                        : SizedBox(
                            width: 60,
                            child: Row(
                              children: const [
                                Text(
                                  '+91',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.arrow_drop_down_outlined)
                              ],
                            ),
                          ),
                    labelText: method,
                  ),
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    TextButton(
                        onPressed: _swapMethod, child: Text('Use $btnText')),
                  ],
                ),
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
              if (isValid) {
                isNumber ? widget._checkNumber(_inputController.text.toString()) : widget._checkEmail(_inputController.text.toString());
              }
              return;
            },
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    isValid ? Colors.deepOrangeAccent : Colors.grey),
            child: const Text('CONTINUE'),
          ),
        )
      ],
    );
  }
}
