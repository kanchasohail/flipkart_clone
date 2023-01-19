import 'package:flutter/material.dart';

class CategoryItemDesign extends StatelessWidget {

  CategoryItemDesign(this.title , this.imgUrl);

  final String title ;
  final String imgUrl ;


  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     color: Colors.orange,
      //     border: Border.all(color: Colors.purple , width: 2)
      // ),
      width: 100,
      child: Column(
        children: [
          Container(
            height: 70,
            // decoration: BoxDecoration(
            //   color: Colors.brown,
            //   border: Border.all(color: Colors.red , width: 2)
            // ),
            child:  Image.network(imgUrl , fit: BoxFit.cover,),
          ),
          Container(
            height: 28,
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Text(title , style: TextStyle(fontSize: 12 , fontFamily: 'rubikBold'),textAlign: TextAlign.center ,softWrap: true, overflow: TextOverflow.ellipsis,maxLines: 2),
            // decoration: BoxDecoration(
            //     color: Colors.tealAccent,
            //     border: Border.all(color: Colors.black , width: 2)
            // ),
          )

        ],
      ),
    );
  }
}
