import 'package:flutter/material.dart';

class AutoSlidingImageContainer extends StatelessWidget {
  AutoSlidingImageContainer({required this.height , required this.imgUrl});
final double height ;
final String imgUrl ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      color: Colors.lightBlue,
      child: Image.network(imgUrl , fit: BoxFit.cover,),
    );
  }
}
