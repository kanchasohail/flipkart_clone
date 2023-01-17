import 'package:flipkart_clone/providers/side_drawer_list_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flipkart_clone/providers/Language_provider.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _listItems = Provider.of<SideDrawerListProvider>(context , listen: false).sideDrawerItems ;
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 68,
              padding: const EdgeInsets.all(16),
              color: Colors.blue.shade800,
              child: Row(
                children: [
                  const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                      child: Text(
                    'Home',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Image.asset('assets/images/flipkart_icon.png'),
                  ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height -200,
              child: ListView.builder(
                itemCount: _listItems.length,
                  itemBuilder: (ctx , index) =>
                Column(
                  children: [
                    if(index == 1 || index == 4 || index == 5 || index == 7 || index == 13) Divider(color: Colors.grey.shade800 , height: 1.5,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                       child: Row(
                          children: [
                            const SizedBox(width: 10,),
                            _listItems[index].icon ,
                            const SizedBox(width: 15,),
                            Text(_listItems[index].title , style: TextStyle(color: Colors.grey.shade600 , fontWeight: FontWeight.w600),),
                            Divider(color: Colors.grey.shade800 , height: 1,)
                          ],
                        )
                      ),
                    ),
                  ],
                )

              ),
            ),
            Divider(color: Colors.grey.shade800 , height: 1),
            FutureBuilder(
              future: Provider.of<LanguageProvider>(context).getLanguage(),
              builder: (ctx, snap) =>
                  snap.connectionState == ConnectionState.waiting
                      ? CircularProgressIndicator()
                      : Container(
                          height: 60,
                          width: double.infinity,
                          color: Colors.blue,
                          child: Center(child:Text(snap.data.toString()),),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
