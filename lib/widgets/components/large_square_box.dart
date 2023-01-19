import 'package:flutter/material.dart';

class LangeSquareBox extends StatelessWidget {
  const LangeSquareBox({Key? key , required this.imageUrl , required this.title , required this.subtitle , required this.price}) : super(key: key);

  final String imageUrl;
  final String title ;
  final String subtitle ;
  final String price ;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 180,
      decoration: BoxDecoration(
        // color: Colors.purple,
          border: Border.all(color: Colors.grey.withOpacity(0.7), width: 0.3),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 200,
              padding: EdgeInsets.only(bottom: 4),
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(3),
                      topLeft: Radius.circular(3)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ))),
          SizedBox(height: 5,),
          FittedBox(
              child: Text(
                title,
                style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w600),
                softWrap: true,
              )),
          FittedBox(
              child: Text(
                subtitle,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )),
          FittedBox(
              child: Text(
                price,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
