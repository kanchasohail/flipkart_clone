import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../providers/wide_sliding_images_list.dart';
import 'auto_sliding_image_container.dart';

class SlidingItem extends StatefulWidget {
  const SlidingItem({Key? key}) : super(key: key);

  @override
  State<SlidingItem> createState() => _SlidingItemState();
}

class _SlidingItemState extends State<SlidingItem> {
  int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          CarouselSlider.builder(
              itemCount: WideSlidingImages.wideSlidingImages.length,
              itemBuilder: (context, index, realIndex) => AutoSlidingImageContainer(
                  height: 173,
                  imgUrl: WideSlidingImages.wideSlidingImages[index]),
              options: CarouselOptions(
                onPageChanged: (index , reason) {
                  setState(() {
                    currentIndex = index ;
                  });
                },
                  height: 173,
                  autoPlay: true,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  initialPage: currentIndex,
                  enlargeCenterPage: true,
                  clipBehavior: Clip.none,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayCurve: Curves.linear,
                  autoPlayAnimationDuration: Duration(milliseconds: 220))),
          Positioned(
            bottom: 8,
            left: MediaQuery.of(context).size.width / 3,
            right: null,
            top: null,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Row(
                children: [
                  ...WideSlidingImages.wideSlidingImages.asMap().entries.map((e) {
                    return Container(
                      margin: EdgeInsets.all(4),
                      width: currentIndex == e.key ? 16 : 7,
                      height: 7,
                      decoration: BoxDecoration(
                          color: currentIndex == e.key ?  Colors.red : Colors.brown,
                          borderRadius: BorderRadius.all(Radius.circular(3))
                      ),
                    );
                  }).toList()
                ],
              ),
            ),
          )
        ]);
  }
}
