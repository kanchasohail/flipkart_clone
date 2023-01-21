import 'package:flipkart_clone/screens/search_screen.dart';
import 'package:flutter/material.dart';

import 'components/custom_switch.dart';

class SearchBarRowWithSwitch extends StatelessWidget {
  const SearchBarRowWithSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.red, width: 1)),

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
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700),
                      ),
                      fit: BoxFit.contain),
                  const SizedBox(
                    height: 5,
                  ),

                  CustomSwitch(),
                  const SizedBox(
                    height: 17,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(SearchScreen.routeName);},
              child: Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    border:
                    Border.all(color: Colors.grey.shade500, width: 1)),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(child: Text('Search for products')),
                    const SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.mic,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
    // return Container(color: Colors.red,height: 100, width: double.infinity,);
  }
}
