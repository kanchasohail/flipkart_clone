import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundedCategoryItem extends StatelessWidget {
  const RoundedCategoryItem(
      {Key? key, required this.imgUrl, required this.title})
      : super(key: key);

  final String imgUrl;

  final String title;

  @override
  Widget build(BuildContext context) {
    final Icon _holderIcon = Icon(
      Icons.image_outlined,
      color: Colors.grey,
      size: double.infinity,
    );
    return Container(
      // decoration: BoxDecoration(
      //     color: Colors.orange,
      //     border: Border.all(color: Colors.purple, width: 2)),
      width: 100,
      child: Column(
        children: [
          Container(
            height: 70,
            child: CircleAvatar(
                radius: 38,
                backgroundColor: Color(0xff54A1E1),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  fit: BoxFit.cover,
                  placeholder: (ctx , url) => _holderIcon,
                  errorWidget: (ctx , url , error) => _holderIcon,
                )),
          ),
          Container(
            height: 28,
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Text(title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis),
          )
        ],
      ),
    );
  }
}
