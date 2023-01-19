import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SquareGridItem extends StatelessWidget {
  const SquareGridItem(this.imageUrl , this.title, {Key? key}) : super(key: key);
final String imageUrl ;
final String title ;
  @override
  Widget build(BuildContext context) {
    final Icon _holderIcon = Icon(
      Icons.image_outlined,
      color: Colors.grey,
      size: double.infinity,
    );
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(3) , topRight: Radius.circular(3)),
              // child: Image.network(imageUrl)
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 180,
              placeholder: (ctx , imageUrl) => _holderIcon,
              errorWidget: (ctx , imageUrl , error) => _holderIcon,
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0 , top: 4),
            child: Text(title , style: TextStyle(fontSize: 12 , fontWeight: FontWeight.bold),),
          ),
          Padding(
             padding: const EdgeInsets.only(left: 8.0),
              child: Text('Min 50% off' ,style: TextStyle(fontWeight: FontWeight.w800 , color: Color(0xff2DB83D)),))
        ],
      ),
    );
  }
}
