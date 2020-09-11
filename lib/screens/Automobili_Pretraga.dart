import 'package:flutter/material.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:intl/intl.dart';
import 'package:AutoShopMujic/screens/AutomobiliScrn.dart';

class AutomobiliPretraga extends StatefulWidget {
  @override
  _AutomobiliPretragaState createState() => _AutomobiliPretragaState();
}

class _AutomobiliPretragaState extends State<AutomobiliPretraga> {
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

  bool dizel = false;
  bool benzin = false;
  bool plin = false;
  bool hibrid = false;
  bool elektro = false;

  void searchFunc() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return AutomobiliScrn();
      },
    ));
  }

  String proizvodjac;
  String gorivo;

  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 7);

  RangeValues rValues = RangeValues(400, 50000);
  String priceMin = "0";
  String priceMax = "50000";
  RangeLabels rLabels = RangeLabels("400", "50000");
  String hint = "Proizvođač";

  static DateTime now = DateTime.now();
  static String formattedDate = DateFormat('yyyy').format(now);

  RangeValues yValues = RangeValues(1940, 2020);
  String priceMinY = "1940";
  String priceMaxY = "2020";
  RangeLabels yLabels = RangeLabels("1940", "2020");

  RangeValues kValues = RangeValues(0, 150000);
  String priceMinK = "0";
  String priceMaxK = "150000";
  RangeLabels kLabels = RangeLabels("0", "150000");

  Widget buildDropDownButton(List<String> lista) {
    return Container(
      child: DropdownButton(
        hint: Text(
          hint,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        items: lista.map((e) {
          return new DropdownMenuItem(
            child: Text(
              e,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            value: e,
          );
        }).toList(),
        onChanged: (String value) {
          setState(() {
            hint = value;
          });
        },
      ),
    );
  }

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

  Widget buildGorivo(
    String title,
    bool gorivo,
    Function function,
  ) {
    return FlatButton.icon(
        focusColor: Colors.white,
        color: Colors.transparent,
        onPressed: function,
        icon: gorivo != true
            ? Icon(Icons.check_box_outline_blank)
            : Icon(
                Icons.check_box,
                color: Color(0xff990000),
              ),
        label: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ));
  }

  @override
  Widget build(BuildContext context) {
    print(formattedDate);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pretraga Automobila"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: searchFunc,
            )
          ],
          centerTitle: true,
          backgroundColor: Color(0xff990000),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  buildText("Proizvođač", Alignment.centerLeft, 25),
                  SizedBox(
                    height: 10,
                  ),
                  buildDropDownButton(proizvodjaci),
                  buildText("Cijena", Alignment.centerLeft, 25),
                  RangeSlider(
                      values: rValues,
                      min: 0,
                      max: 50000,
                      divisions: 500,
                      labels: rLabels,
                      onChanged: (values) {
                        setState(() {
                          priceMin = values.start.round().toString();
                          priceMax = values.end.round().toString();
                          rValues = values;
                          rLabels = RangeLabels(values.start.round().toString(),
                              values.end.round().toString());
                        });
                      }),
                  buildText(
                      "Pretraga za cijene od $priceMin KM do $priceMax KM",
                      Alignment.center,
                      18),
                  SizedBox(
                    height: 10,
                  ),
                  buildText("Gorivo", Alignment.centerLeft, 25),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      child: Scrollbar(
                        controller: _scrollController,
                        child: FadingEdgeScrollView.fromScrollView(
                          gradientFractionOnEnd: 0.4,
                          gradientFractionOnStart: 0,
                          child: ListView(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              buildGorivo(
                                "Dizel",
                                dizel,
                                () {
                                  setState(
                                    () {
                                      dizel = !dizel;
                                    },
                                  );
                                },
                              ),
                              buildGorivo(
                                "Benzin",
                                benzin,
                                () {
                                  setState(() {
                                    benzin = !benzin;
                                  });
                                },
                              ),
                              buildGorivo(
                                "Plin",
                                plin,
                                () {
                                  setState(() {
                                    plin = !plin;
                                  });
                                },
                              ),
                              buildGorivo(
                                "Hibrid",
                                hibrid,
                                () {
                                  setState(() {
                                    hibrid = !hibrid;
                                  });
                                },
                              ),
                              buildGorivo(
                                "Elektro",
                                elektro,
                                () {
                                  setState(() {
                                    elektro = !elektro;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  buildText("Godište", Alignment.centerLeft, 25),
                  RangeSlider(
                      values: yValues,
                      min: 1940,
                      max: 2020,
                      divisions: 100,
                      labels: yLabels,
                      onChanged: (valuesy) {
                        setState(() {
                          priceMinY = valuesy.start.round().toString();
                          priceMaxY = valuesy.end.round().toString();
                          yValues = valuesy;
                          yLabels = RangeLabels(
                              valuesy.start.round().toString(),
                              valuesy.end.round().toString());
                        });
                      }),
                  buildText("Pretraga za godište od $priceMinY. do $priceMaxY.",
                      Alignment.center, 20),
                  SizedBox(
                    height: 10,
                  ),
                  buildText("Kilometraža", Alignment.center, 25),
                  RangeSlider(
                      values: kValues,
                      min: 0,
                      max: 150000,
                      divisions: 150,
                      labels: kLabels,
                      onChanged: (valuesk) {
                        setState(() {
                          priceMinK = valuesk.start.round().toString();
                          priceMaxK = valuesk.end.round().toString();
                          kValues = valuesk;
                          kLabels = RangeLabels(
                              valuesk.start.round().toString(),
                              valuesk.end.round().toString());
                        });
                      }),
                  buildText(
                      "Pretraga za kilometražu od $priceMinK do $priceMaxK",
                      Alignment.center,
                      18),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
