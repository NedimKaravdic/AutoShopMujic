import 'package:flutter/material.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

/* class IzdvojeneKategorije extends StatelessWidget {
  ScrollController scrollController;
  final List<Map<String, String>> kategorije = [
    {'title': "Gume", 'path': "images/gume.png"},
    {'title': "Maglenke", 'path': "images/maglenke.png"},
    {'title': "Presvlake", 'path': "images/presvlake.png"},
    {'title': "Retrovizori", 'path': "images/retrovizori.png"},
  ];

  List<T> map<T>(List list, Function function) {
    List<T> wdgts = [];
    for (var i = 0; i < list.length; i++) {
      wdgts.add(function(i, list[i]));
    }
    return wdgts;
  }

  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 7);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: FadingEdgeScrollView.fromScrollView(
          gradientFractionOnEnd: 0.1,
          gradientFractionOnStart: 0,
          child: ListView(
            controller: _scrollController,
            addRepaintBoundaries: true,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: map<Widget>(kategorije, (index, title) {
              return Container(
                padding: EdgeInsets.only(bottom: 10),
                height: 100,
                width: 200,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image(
                        height: 150,
                        width: 200,
                        image: AssetImage(
                          title['path'],
                        ),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black.withAlpha(220),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                            )),
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            title["title"],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
} */

Widget buildCard(String title, String path) {
  return Container(
    width: 190,
    height: 160,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            child: Image(
              image: AssetImage(path),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black.withAlpha(220),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

class IzdvojeneKategorije extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          buildCard("Interijer", "images/interijer.jpg"),
          buildCard("Eksterijer", "images/eksterijer.jpg"),
        ]));
  }
}
