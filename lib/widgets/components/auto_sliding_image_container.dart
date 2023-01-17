
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class AutoSlidingImageContainer extends StatelessWidget {
  AutoSlidingImageContainer({required this.height , required this.imgUrl});
final double height ;
final String imgUrl ;

  @override
  Widget build(BuildContext context) {
    final Icon holderIcon = Icon(Icons.image_outlined , color: Colors.grey , size: height,);
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade300,
      // child: Image.network(imgUrl , fit: BoxFit.cover),
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        fit: BoxFit.cover,
        // placeholder: (ctx , url) => holderIcon,
        errorWidget: (context, url, error) => holderIcon,
      ),
    );
  }
}
