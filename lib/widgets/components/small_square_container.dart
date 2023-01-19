import 'package:flutter/material.dart';

class SmallSquareContainer extends StatelessWidget {
  const SmallSquareContainer(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.offer})
      : super(key: key);

  final String imageUrl;
  final String title;

  final String offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 110,
      decoration: BoxDecoration(
          // color: Colors.purple,
          border: Border.all(color: Colors.grey.withOpacity(0.7), width: 0.4),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        children: [
          Container(
              height: 80,
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(3),
                      topLeft: Radius.circular(3)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ))),
          FittedBox(
              child: Text(
            title,
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
            softWrap: true,
          )),
          FittedBox(
              child: Text(
            offer,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ))
        ],
      ),
    );
  }
}
