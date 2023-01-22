import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search-screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search for Products, Brand and More',
              contentPadding: EdgeInsets.symmetric(vertical: 12 , horizontal: 12),
              suffixIcon: IconButton(onPressed: () {  }, icon: Icon(Icons.search),),

            ),
          ),
        ),
      ),
    );
  }
}
