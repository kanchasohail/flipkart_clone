import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryGridCard extends StatelessWidget {
  const CategoryGridCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.imgUrl,
      required this.bgColor})
      : super(key: key);

  final String title;

  final String description;

  final String imgUrl;

  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    final Icon _holderIcon = Icon(
      Icons.image_outlined,
      color: Colors.grey,
      size: double.infinity,
    );
    return Container(
      decoration:
          BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
                height: 110,
                width: 110,
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  fit: BoxFit.cover,
                  placeholder: (ctx, url) => _holderIcon,
                  errorWidget: (ctx, url, error) => _holderIcon,
                )),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: Text(
                '$title  >',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              )),
          Positioned(
              top: 36,
              left: 10,
              child: Text(
                description,
                style: TextStyle(
                    color: Colors.grey.shade700, fontWeight: FontWeight.w400),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ))
        ],
      ),
    );
  }
}
