import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryItemDesign extends StatelessWidget {

  CategoryItemDesign(this.title , this.imgUrl);

  final String title ;
  final String imgUrl ;


  @override
  Widget build(BuildContext context) {
    final Icon _holderIcon = Icon(Icons.image_outlined , color: Colors.grey , size: double.infinity,);
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
            color: Colors.grey.shade300,
            // decoration: BoxDecoration(
            //   color: Colors.brown,
            //   border: Border.all(color: Colors.red , width: 2)
            // ),
            child:  CachedNetworkImage(
              imageUrl: imgUrl,
                fit: BoxFit.cover,
              placeholder: (ctx , url) => _holderIcon,
              errorWidget: (ctx , url , error) => _holderIcon,
            )
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
