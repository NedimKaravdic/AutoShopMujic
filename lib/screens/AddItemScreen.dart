import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  static String routeName = "/AddItemScreen";
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  List<String> proizvodjaci = [
    "Alfa Romeo",
    "Audi",
    "BMW",
    "Citroen",
    "Fiat",
    "Ford",
    "Hyundai",
    "Jeep",
    "Mazda",
    "Mercedes-Benz",
    "Mitsubishi",
    "Nissan",
    "Opel",
    "Peugeot",
    "Renault",
    "Seat",
    "Škoda",
    "Toyota",
    "Volkswagen",
    "Volvo",
    "Chevrolet",
    "Kia"
  ];

  Widget buildText(String text, Alignment alignment, double size) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 15),
      child: Align(
        alignment: alignment,
        child: Text(text,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: size)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dodavanje Artikala"),
        centerTitle: true,
        backgroundColor: Color(0xff990000),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                buildText("Naziv Artikla", Alignment.centerLeft, 25),
                SizedBox(
                  height: 2,
                ),
                Container(
                  margin: EdgeInsets.all(7),
                  child: TextFormField(
                    autocorrect: false,
                    autofocus: false,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    cursorColor: Color(0xff990000),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color(0xff990000), width: 2.5)),
                        hintText: "Naziv Artikla"),
                  ),
                ),
                buildText("Cijena", Alignment.centerLeft, 25),
                Container(
                  width: 120,
                  child: TextFormField(
                    cursorColor: Color(0xff990000),
                    autofocus: false,
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Cijena u BAM",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff990000),width: 2 ),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
