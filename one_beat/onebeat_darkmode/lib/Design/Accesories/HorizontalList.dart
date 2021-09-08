


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DaysList extends StatefulWidget {
  const DaysList({Key? key}) : super(key: key);

  @override
  _DaysListState createState() => _DaysListState();
}

class _DaysListState extends State<DaysList> {
  @override
  Widget build(BuildContext context) {

    return CarouselSlider(
      options:  CarouselOptions(
        height: 400,
        aspectRatio: 16/9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.amber
                ),
                child: Text('text $i', style: TextStyle(fontSize: 16.0),)
            );
          },
        );
      }).toList(),
    );
  }
}
