import 'package:flipkart_clone/widgets/custom_switch.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Row(
      //     children: [
      //       Image.asset('assets/images/flipkart_icon.png' , height: 30, width: 30,),
      //       const SizedBox(width: 10,),
      //       const Text('Flipkart' , style: TextStyle( fontFamily: 'rubik' , color: Color(0xff047BD5) , fontSize: 22),)
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 17,
            ),
            Row(
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
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 1)),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        FittedBox(
                            child: Text(
                              'Brand Mall',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                            fit: BoxFit.contain),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomSwitch(),
                        const SizedBox(
                          height: 11,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        border: Border.all(color: Colors.grey, width: 2)),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: Text('Search for products')),
                        SizedBox(
                          width: 30,
                        ),
                        Icon(Icons.mic),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.camera_alt_outlined)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
