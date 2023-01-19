import 'package:flutter/material.dart';

class AppBarRowWithLogo extends StatelessWidget {
  const AppBarRowWithLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 14,
        ),
        Image.asset(
          'assets/images/flipkart_icon.png',
          height: 32,
          width: 31,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'Flipkart',
          style: TextStyle(
              fontFamily: 'rubik',
              color: Color(0xff047BD5),
              fontSize: 22),
        )
      ],
    );
  }
}
