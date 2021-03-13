import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:flowers/presentation/pages/cart/carts.dart';
import 'package:flowers/presentation/pages/favourite/favourites.dart';
import 'package:flowers/presentation/pages/mainpage/mainpage.dart';
import 'package:flowers/presentation/pages/settings/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:MyMain() ,);
  }
}

class MyMain extends StatefulWidget {
  @override
  _MyMainState createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  int selectedIndex = 0;
  Color _bgColor = Colors.white;

  var page = [
    MainPage(),
    Carts(),
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
        highlightColor: Colors.white60,
        // highlightColor: Colors.white.withOpacity(0.1),

        navFgColor: Colors.blue.shade900,
        // navFgColor: Colors.grey.withOpacity(0.8),
        navBgColor: Colors.white,

      ),
    );
  }
}
