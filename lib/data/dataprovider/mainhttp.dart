import 'dart:convert';
import 'package:flowers/data/models/authmodel.dart';
import 'package:flowers/data/models/mainmodel.dart';
import 'package:flowers/data/models/productmodel.dart';
import 'package:http/http.dart';

class MainHttps {
  //http://fl.route.uz/clintapi/category
  //http://fl.route.uz/clintapi/products
  static String baseUrl = "fl.route.uz";
  static Map<String, String> headers = {
    "Content-type": "application/json; charset=UTF-8"
  };
  static String urlCategories = "/clintapi/category";
  static String urlAuth = "/clintapi/auth";
  static String urlProduct = "/clintapi/products";

  static Map<String, dynamic> emptParams() {
    Map<String, dynamic> maps = new Map();
    return maps;
  }

  static Future<String> getMain(
      {String api,
      Map<String, dynamic> params,
      Map<String, String> headers}) async {
    var uri = Uri.https(baseUrl, api);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else
      return null;
  }

  static MainModel parseModel(String response) {
    dynamic json = jsonDecode(response);
    var data = MainModel.fromJson(json);
    return data;
  }

  static GetDataMain parseModel2(String response) {
    dynamic json = jsonDecode(response);
    var data = GetDataMain.fromJson(json);
    return data;
  }

  static AuthModel parseAuth({String response}) {
    dynamic json = jsonDecode(response);
    var data = AuthModel.fromJson(json);
    return data;
  }

  static AuthData parseAuthData({String data}) {
    dynamic json = jsonDecode(data);
    var dataa = AuthData.fromJson(json);
    return dataa;
  }

//parse product
  static ProductModelOne parseProductOne({String data}) {
    dynamic json = jsonDecode(data);
    var dataa = ProductModelOne.fromJson(json);
    return dataa;
  }

  static ProductModel parseProduct({String data}) {
    dynamic json = jsonDecode(data);
    var dataa = ProductModel.fromJson(json);
    return dataa;
  }

  static ProductModelImages parseImageOne({String data}) {
    print("----0");
    print(data);
    dynamic json = jsonDecode(data);
    var dataa = ProductModelImages.fromJson(json);
    return dataa;
    print("----0");
  }

  static Map<String, dynamic> sendAccessToken({String accessToken}) {
    Map<String, String> maps = {"access_token": "$accessToken"};
    return maps;
  }
}
