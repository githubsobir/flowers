import 'dart:ui';

import 'package:flowers/data/dataprovider/mainhttp.dart';
import 'package:flowers/data/models/authmodel.dart';
import 'package:flowers/data/models/mainmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String getValue;
  List<GetDataMain> getDataMain = new List();
  AuthData _authData;
  InfiniteScrollController controller;
  int selectedIndex = 0;

  void loginAuth(){
    MainHttps.getMain(api: MainHttps.urlAuth, params: MainHttps.emptParams())
        .then((value) => {
      _authResponse(response: value),
    });
  }
  void _authResponse({String response}){
    AuthModel authModel = MainHttps.parseAuth(response: response);
    setState(() {
      _authData = authModel.data;
    });
      print(_authData.accessToken);
  }
  void parse() {
    MainHttps.getMain(api: MainHttps.urlCategories, params: MainHttps.emptParams())
        .then((value) => {


              getValue = value,

              _showResponse(getValue),
            });
  }

  void _showResponse(String body) {
    MainModel mainModel = MainHttps.parseModel(body);
    setState(() {
      getDataMain = mainModel.data;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginAuth();
    parse();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(231, 234, 245, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(size * 0.02),
                  child: Row(
                    children: [
                      Text(
                        "Product Category",
                        style: TextStyle(
                            fontSize: size * 0.05,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size * 0.015,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: size * 0.12,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: getDataMain.map((e) {
                      return _itemOfStory(e, size);
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // child: ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: 8,
                  //   itemBuilder: (context, index) {
                  //     return _itemOfPost(getDataMain.name);
                  //   },
                  // ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _itemOfStory(GetDataMain getDataMain, double size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size * 0.03),
      margin:
          EdgeInsets.symmetric(horizontal: size * 0.01, vertical: size * 0.01),
      height: size * 0.22,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size * 0.01),
          color: Colors.white),
      child: Center(
        child: Row(
          children: [
            // rgb(64,61,218)

            Icon(
              Icons.favorite_border,
              color: Color.fromRGBO(64, 61, 218, 1),
            ),
            SizedBox(
              width: size * 0.02,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                getDataMain.name,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
