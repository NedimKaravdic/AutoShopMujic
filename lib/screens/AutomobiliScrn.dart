import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AutomobiliScrn extends StatefulWidget {
  @override
  _AutomobiliState createState() => _AutomobiliState();
}

class _AutomobiliState extends State<AutomobiliScrn> {
  @override
  Widget build(BuildContext context) {
    Stream collectionStream = FirebaseFirestore.instance
        .collection('Artikli/Automobili/Alfa Romeo')
        .snapshots();

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Automobili"),
            backgroundColor: Color(0xff990000),
            centerTitle: true,
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: collectionStream,
            builder: (ctx, snapshot) {
              if (snapshot.hasError) {
                print("Somethig Went Wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              return ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return Container(
                    width: double.infinity,
                    height: 250,
                    child: Card(
                      elevation: 10,
                      child: Column(
                        children: <Widget>[],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          )),
    );
  }
}
