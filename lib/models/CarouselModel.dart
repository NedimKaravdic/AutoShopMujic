import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselModel extends StatefulWidget {
  @override
  _CarouselModelState createState() => _CarouselModelState();
}

class _CarouselModelState extends State<CarouselModel> {
  int _current = 0;
  int colorIndex = 0;

  List<String> homeImages = [
    "images/autoshop.jpg",
    "images/dijelovi.jpg",
    "images/golf.jpg",
    "images/skoda.jpg"
  ];

  List<String> naslovi = [
    "Dobrodošli u ",
    "Najpovoljniji ",
    "Sve za",
    "Dobrodošli u ",
    "Dobrodošli u "
  ];
  List<String> podnaslovi = [
    "Auto Shop Mujić",
    "Auto Dijelovi",
    "Vaše Auto",
    "Auto Shop Mujić",
    "Auto Shop Mujić"
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CarouselSlider(
        options: CarouselOptions(
          height: 200,
          initialPage: 0,
          autoPlay: true,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          reverse: false,
          enableInfiniteScroll: true,
          onPageChanged: (int index, _current) {
            setState(() {
              colorIndex = index;
            });
          },
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 2000),
          scrollDirection: Axis.horizontal,
        ),
        items: homeImages.map((e) {
          _current = homeImages.indexOf(e);

          return Builder(
            builder: (
              BuildContext context,
            ) {
              return Center(
                child: Card(
                    child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          child: Image.asset(
                            e,
                            fit: BoxFit.fill,
                            color: Colors.black.withOpacity(0.55),
                            colorBlendMode: BlendMode.multiply,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            naslovi[homeImages.indexOf(e)].toString(),
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text(podnaslovi[homeImages.indexOf(e)].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28)),
                        ],
                      ),
                    )
                  ],
                )),
              );
            },
          );
        }).toList(),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: map<Widget>(homeImages, (index, url) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorIndex == index ? Color(0xff990000) : Colors.grey,
              ),
            );
          })),
    ]);
  }
}
