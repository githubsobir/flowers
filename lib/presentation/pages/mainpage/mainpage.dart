import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:flowers/data/dataprovider/mainhttp.dart';
import 'package:flowers/data/models/authmodel.dart';
import 'package:flowers/data/models/mainmodel.dart';
import 'package:flowers/data/models/productmodel.dart';
import 'package:flowers/presentation/pages/mainpage/viewflowers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String getValue;
  List<GetDataMain> getDataMain = [];
  List<ProductModel> _productModel = [];
  AuthData _authData;

  // var boxs = Hive.box("online");

  InfiniteScrollController controller;
  int selectedIndex = 0;
  Map<String, String> map = {};
  List<bool> likeButton = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generatorRandom();
    loginAuth();
    parse();
    // getHttp();
  }

  //Generator Random
  String generatorRandom() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyyMMdd');
    String formattedDate = formatter.format(now);
    var random = new Random();
    String k = random.nextInt( 9999-1050).toString();
    print(formattedDate+k);

    return formattedDate;
  }

  // #Auth
  void loginAuth() {
    MainHttps.getMain(
            api: MainHttps.urlAuth,
            params: MainHttps.emptParams(),
            headers: MainHttps.headers)
        .then((value) => {
              _authResponse(response: value),
            });
  }

  void _authResponse({String response}) {
    AuthModel authModel = MainHttps.parseAuth(response: response);
    setState(() {
      _authData = authModel.data;
      getProduct(_authData.accessToken);
    });
  }

  // #Categories
  void parse() {
    MainHttps.getMain(
            api: MainHttps.urlCategories,
            params: MainHttps.emptParams(),
            headers: MainHttps.headers)
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

  // #products
  void getProduct(String accessToken) {
    map = {"X-Access-Token": "$accessToken"};
    MainHttps.getMain(
            api: MainHttps.urlProduct,
            params: MainHttps.emptParams(),
            headers: map)
        .then((value) => {
              parseProduct(response: value),
            });
  }

  void parseProduct({String response}) {
    print(response);
    ProductModelOne mainModel = MainHttps.parseProductOne(data: response);

    setState(
      () {
        _productModel = mainModel.data;
      },
    );
  }

  void parseProductModelImages({String response}) {
    print("=>>> " + response.toString());
    ProductModelImages mainModel = MainHttps.parseImageOne(data: response);
    setState(() {
      print(mainModel.image);
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(231, 234, 245, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Flowers",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.location_on_outlined,
                size: 20,
                color: Colors.black,
              ),
              tooltip: "Location",
              onPressed: () {}),
        ],
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
                  margin: EdgeInsets.all(size * 0.02),
                  child: Row(
                    children: [
                      Text(
                        "All Products",
                        style: TextStyle(
                            fontSize: size * 0.05,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _productModel.length,
                    itemBuilder: (context, index) {
                      return _itemOfProduct(
                          productModel: _productModel[index], size: size);
                    },
                  ),
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
      child: GestureDetector(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }

  Widget bottomSheet() {
    List<String> myList = [
      "Andijon",
      "Buxoro",
      "Guliston",
      "Andijon",
    ];
  }

  Widget _itemOfProduct({ProductModel productModel, double size}) {
    return Container(
      width: size,
      padding: EdgeInsets.all(size * 0.03),
      margin: EdgeInsets.all(size * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size * 0.02),
      ),
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              height: size * 0.35,
              width: size * 0.3,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: NetworkImage(
                    "https://fl.route.uz/img/" + productModel.image,
                  ),
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      LikeButton(
                        animationDuration: Duration(milliseconds: 800),
                        size: 20,
                        circleColor: CircleColor(
                            start: Color(0xf00ff0f0), end: Color(0xff0099cc)),
                        bubblesColor: BubblesColor(
                          dotPrimaryColor: Color(0xff33b5e5),
                          dotSecondaryColor: Color(0xff0099cc),
                        ),
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            Icons.favorite,
                            color: isLiked ? Colors.red : Colors.grey,
                            size: 20,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () {
              ViewFlowers1.structure = productModel.structure;
              ViewFlowers1.prices = productModel.prices;
              ViewFlowers1.sellersId = productModel.sellersId;
              ViewFlowers1.descriptions = productModel.descriptions;
              ViewFlowers1.name = productModel.name;
              ViewFlowers1.height = productModel.heigth;
              ViewFlowers1.size = productModel.size;
              ViewFlowers1.images = productModel.images;
              ViewFlowers1.recommendation = productModel.recommendation;

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ViewFlowers1(),
              ));
            },
          ),
          SizedBox(
            width: size * 0.1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.name.toString(),
                style: TextStyle(
                    fontSize: size * 0.04,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: size * 0.01,
              ),
              Row(
                children: [
                  Icon(
                    Icons.monetization_on,
                    color: Colors.blue,
                  ),
                  Text(
                    productModel.prices.toString(),
                    style: TextStyle(
                        fontSize: size * 0.04,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: size * 0.01,
              ),
              Row(
                children: [
                  Icon(
                    Icons.stars_rounded,
                    color: Colors.yellow.shade800,
                  ),
                  Text(
                    productModel.prices.toString(),
                    style: TextStyle(
                        fontSize: size * 0.04,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: size * 0.01,
              ),
              // color: Color.fromARGB(0,184,147,1),

              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      duration: Duration(milliseconds: 300),
                      content: Text("${productModel.id}")));
                },
                child: Container(
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: size * 0.01,
                      ),
                      Text(
                        "Buy Now",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
