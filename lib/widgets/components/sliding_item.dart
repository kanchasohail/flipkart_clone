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
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Stack(children: [
      CarouselSlider.builder(
          itemCount: WideSlidingImages.wideSlidingImages.length,
          itemBuilder: (context, index, realIndex) => AutoSlidingImageContainer(
              height: 173, imgUrl: WideSlidingImages.wideSlidingImages[index]),
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
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
        left: isPortrait
            ? MediaQuery.of(context).size.width / 2.9
            : MediaQuery.of(context).size.width / 2.25,
        right: null,
        top: null,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(
            children: [
              ...WideSlidingImages.wideSlidingImages.asMap().entries.map((e) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                  width: currentIndex == e.key ? 12 : 6.5,
                  height: 6.5,
                  decoration: BoxDecoration(
                      color: currentIndex == e.key
                          ? Colors.white
                          : Colors.grey.shade500.withOpacity(0.8),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                );
              }).toList()
            ],
          ),
        ),
      )
    ]);
  }
}
