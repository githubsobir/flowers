import 'dart:io';

import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:flowers/presentation/pages/cart/shopping.dart';
import 'package:flowers/presentation/pages/favourite/favourites.dart';
import 'package:flowers/presentation/pages/mainpage/mainpage.dart';
import 'package:flowers/presentation/pages/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  // HttpOverrides.global = new MyHttpOverrides();
  // var box = await Hive.openBox('online');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyMain() ,);
  }
}

class MyMain extends StatefulWidget {
  @override
  _MyMainState createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  int selectedIndex = 0;


  var page = [
    MainPage(),
    Shopping(),
    Favourites(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: page[selectedIndex],
      bottomNavigationBar: AwesomeBottomNav(

        icons: [
          Icons.home_outlined,
          Icons.shopping_basket_outlined,
          Icons.favorite_border,
          Icons.settings,

        ],
        highlightedIcons: [
          Icons.home,
          Icons.shopping_basket,
          Icons.favorite,
          Icons.settings,
        
        ],
        onTapped: (int value) {
          setState(() {
            selectedIndex = value;
          });
        },


        bodyBgColor: Colors.white60,
        highlightColor: Colors.blueGrey,
        // highlightColor: Colors.white.withOpacity(0.1),

        navFgColor: Colors.blue.shade900,
        // navFgColor: Colors.grey.withOpacity(0.8),
        navBgColor: Colors.white,

      ),
    );
  }
}
