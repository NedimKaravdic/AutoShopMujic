import 'package:flutter/material.dart';
import 'package:AutoShopMujic/models/CustomDrawer.dart';
import 'package:AutoShopMujic/models/CarouselModel.dart';
import 'package:AutoShopMujic/models/IzdvojeneKategorije.dart';
import 'package:AutoShopMujic/models/CustomDivider.dart';
import 'package:AutoShopMujic/models/Automobili.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

void onActionClick() {
  print("Test");
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildIcons(Function function, Icon icon) {
    return GestureDetector(
        onTap: function,
        child: Container(
          child: icon,
          margin: EdgeInsets.only(right: 15),
        ));
  }

  TextEditingController _controller = TextEditingController();

  Widget buildText(String text) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          actions: <Widget>[
            buildIcons(
                onActionClick,
                Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 25,
                )),
            buildIcons(onActionClick,
                Icon(Icons.shopping_cart, color: Colors.white, size: 25))
          ],
          title: Container(
            height: 38,
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
              margin: EdgeInsets.only(
                left: 4,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      child: TextFormField(
                        controller: _controller,
                        maxLines: 1,
                        style: TextStyle(color: Theme.of(context).cursorColor),
                        autocorrect: false,
                        autofocus: false,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Pretraga",
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          backgroundColor: Color(0xff990000),
        ),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: Container(
              margin: EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CarouselModel(),
                  SizedBox(
                    height: 6,
                  ),
                  buildText("Autodijelovi"),
                  SizedBox(
                    height: 5,
                  ),
                  IzdvojeneKategorije(),
                  SizedBox(
                    height: 3,
                  ),
                  CustomDivider(),
                  SizedBox(
                    height: 3.45,
                  ),
                  buildText("Automobili"),
                  SizedBox(
                    height: 6,
                  ),
                  Automobili(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
