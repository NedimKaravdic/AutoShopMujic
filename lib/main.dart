import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:AutoShopMujic/screens/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/loginScreen.dart';
import 'screens/AddItemScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AutoShopMujic());
}

class AutoShopMujic extends StatefulWidget {
  @override
  _AutoShopMujicState createState() => _AutoShopMujicState();
}

class _AutoShopMujicState extends State<AutoShopMujic> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: null)],
      child: MaterialApp(
        theme: ThemeData(
            highlightColor: Color(0xff990000),
            primarySwatch: Colors.red,
            cursorColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          AddItemScreen.routeName: (context) => AddItemScreen(),
        },
      ),
    );
  }
}
